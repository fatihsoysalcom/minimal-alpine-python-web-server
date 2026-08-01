# Use Alpine Linux as the base image for a minimal footprint.
FROM alpine:3.18

# Install Python3 and pip. Alpine uses 'apk add' for package management.
# '--no-cache' keeps the image size small, aligning with Alpine's philosophy.
RUN apk add --no-cache python3 py3-pip

# Set the working directory inside the container.
WORKDIR /app

# Create a simple Python web server script directly in the Dockerfile.
# This demonstrates a self-contained minimal application, ideal for a homelab.
# The script serves a fixed HTML message on port 8000.
RUN echo 'import http.server' > app.py && \
    echo 'import socketserver' >> app.py && \
    echo '' >> app.py && \
    echo 'PORT = 8000' >> app.py && \
    echo '' >> app.py && \
    echo 'class MyHandler(http.server.SimpleHTTPRequestHandler):' >> app.py && \
    echo '    def do_GET(self):' >> app.py && \
    echo '        self.send_response(200)' >> app.py && \
    echo '        self.send_header("Content-type", "text/html")' >> app.py && \
    echo '        self.end_headers()' >> app.py && \
    echo '        self.wfile.write(b"<html><body><h1>Hello from Alpine Homelab!</h1><p>This is a minimal Python web server running in an Alpine Linux container.</p></body></html>")' >> app.py && \
    echo '' >> app.py && \
    echo 'with socketserver.TCPServer(("", PORT), MyHandler) as httpd:' >> app.py && \
    echo '    print(f"Serving on port {PORT}")' >> app.py && \
    echo '    httpd.serve_forever()' >> app.py

# Expose the port the web server will listen on.
EXPOSE 8000

# Command to run the Python web server when the container starts.
CMD ["python3", "app.py"]
