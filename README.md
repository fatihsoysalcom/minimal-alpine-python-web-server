# Minimal Alpine Python Web Server

This example demonstrates building a minimal web server using Alpine Linux as the base image within a Docker container. It showcases Alpine's lightweight nature by embedding a simple Python HTTP server directly into the Dockerfile, resulting in a very small and efficient service suitable for a homelab. This approach aligns with the article's focus on energy-efficient and resource-friendly server setups.

## Language

`dockerfile`

## How to Run

1. Save the code above as `Dockerfile` in an empty directory.
2. Build the Docker image: `docker build -t alpine-homelab-server .`
3. Run the container, mapping port 8000: `docker run -p 8000:8000 alpine-homelab-server`
4. Access the server in your web browser at `http://localhost:8000`.

## Original Article

This example accompanies the Turkish article: [Alpine Linux ile Minimal Homelab Sunucusu Kurulumu ve Yönetimi](https://fatihsoysal.com/blog/alpine-linux-ile-minimal-homelab-sunucusu-kurulumu-ve-yonetimi/).

## License

MIT — see [LICENSE](LICENSE).
