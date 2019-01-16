# Build

docker build --no-cache --rm -t [tag]/restic .


# Testing

## Quick

docker run --rm [tag]/restic restic

## Sample local backup test

### macOS

- Init blank repository

docker run --rm --env RESTIC_PASSWORD=1234 -v ~/docker_data/restic:/mnt/restic [tag]/restic restic init --repo /mnt/restic

- Backup a folder

docker run --rm --env RESTIC_PASSWORD=1234 -v ~/docker_data/restic:/mnt/restic -v /:/data [tag]/restic restic -r /mnt/restic backup /data/[subfolder]

- Restore from backup

docker run --rm --env RESTIC_PASSWORD=1234 -v ~/docker_data/restic:/mnt/restic -v /:/data [tag]/restic restic -r /mnt/restic restore latest --target /data/[subfolder]
