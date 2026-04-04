# Docker Volumes

---

## Problem
Containers are ephemeral, meaning they are short-lived. If a container is deleted or crashes, any data stored inside its internal file system 
is lost forever.

## Example: 
Imagine an Nginx container that stores user access logs. If that container goes down and is replaced by a new one, all the 
previous logs are gone. For an organization, this is a major issue for security auditing and user tracking.

## Solution
To overcome this problem we require the Persistent Storage
Persistent Storage means storing data in such a way that it remains safe even after a system, application, or container stops, restarts, or crashes.

There are 2 different ways how docker solves this problem.

1.Bind Mounts

2.Volumes

<img width="949" height="531" alt="Screenshot 2026-04-04 173733" src="https://github.com/user-attachments/assets/ad787ed4-443c-4913-814c-7201ae621d04" />


## Bind Mounts
A Bind Mount connects a folder from your Host machine directly into a Docker container.
Whatever happens in one → reflects in the other instantly.
- Host = your laptop/server
- Container = running application

## Step-by-Step Hands-On Example

✅ Step 1: Create a folder on host

```bash
mkdir bind-demo
cd bind-demo
echo "Hello from host" > file.txt
```

✅ Step 2: Run container with bind mount
```bash
docker run -it --mount type=bind,source=$(pwd),target=/app ubuntu bash
```
🔍 Breakdown:
- type → volume/bind mount
- $(pwd) → current host folder(source)
- /app → container folder(destination)

✅ Step 3: Check inside container
```bash
cat /app/file.txt
```
👉 Output:
```bash
Hello from host
```
✅ Step 4: Modify from container
```bash
echo "Changed from container" > /app/file.txt
```
Exit container:
```bash
exit
```
✅ Step 5: Check in host
```bash
cat file.txt
```
👉 Output:
```bash
Changed from container
```

## Volumes

A Docker Volume is:
- Storage managed by Docker
- Used to store persistent data
- Survives even if container is deleted

### Hands-On (Step by Step)

✅ Step 1: Create volume
```bash
docker volume create myvolume
```

✅ Step 2: Run container with volume

```bash
docker run -it \
  --mount type=volume,source=myvolume,target=/data \
  ubuntu bash
```

✅ Step 3: Store data

```bash
echo "Hello Volume" > /data/file.txt
exit
```
Output:
```bash
Hello Volume
```

✅ Step 4: Remove container

```bash
docker rm <container_id>
```

✅ Step 5: Run again
```bash
docker run -it \
  --mount type=volume,source=myvolume,target=/data \
  ubuntu bash
```

✅ Step 6: Verify
```bash
cat /data/file.txt
```
Output:
```bash
Hello Volume
```
