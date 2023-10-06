# Use the official Nginx image as the base image
FROM nginx

# Optional: Set a label to provide some metadata
LABEL maintainer="your-name@example.com"

# Optional: Copy custom Nginx configuration files (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY custom-site.conf /etc/nginx/conf.d/custom-site.conf

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"
# Use the above created unprivileged user
USER 10014

# Start the Nginx web server when a container based on this image is started
CMD ["nginx", "-g", "daemon off;"]
