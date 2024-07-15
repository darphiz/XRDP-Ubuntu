
# XRDP Setup Script

Easily set up an XRDP server on your Ubuntu VM with this automated script.

## Features

- Installs and configures XRDP and XFCE4.
- Creates a superuser with your chosen username and password.
- Opens RDP port in the firewall.

## How to Use

1. **Download and Run the Script:**

   ```bash
   wget https://example.com/setup_xrdp.sh -O setup_xrdp.sh
   chmod +x setup_xrdp.sh
   sudo ./setup_xrdp.sh
   ```

2. **Follow the Prompts:**
   Enter your desired username and password.

## Example

```
Enter the username: <your_username>
Enter the password: <your_password>
Confirm the password: <your_password>
XRDP setup complete. You can now connect via RDP using the username '<your_username>'.
```

## License

MIT License