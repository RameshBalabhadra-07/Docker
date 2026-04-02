# Docker Volumes

---

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

## Bind Mounts
A Bind Mount connects a folder from your Host machine directly into a Docker container.
Whatever happens in one → reflects in the other instantly.
- Host = your laptop/server
- Container = running application

🧪 3. Step-by-Step Hands-On Example
✅ Step 1: Create a folder on host

```bash
mkdir bind-demo
cd bind-demo
echo "Hello from host" > file.txt <host_path>:<container_path> <image_name> /bin/bash
```
