# NVIDIA GPU Remote Development Setup

This repository contains configuration files and scripts to set up a tight connection between your local Visual Studio Code environment and a rented NVIDIA GPU instance.

## Prerequisites

- Visual Studio Code installed locally
- SSH client configured
- Access to NVIDIA licensing server: https://ui.licensing.nvidia.com/license-server/details/eeeea609-ec4f-11f0-9b78-0639de80ac33?tab=2
- Remote NVIDIA GPU instance (AWS P3, Google Cloud AI Platform, etc.)

## Quick Setup

### 1. Clone this repository
```bash
git clone <your-repo-url>
cd nvidia-gpu-setup
```

### 2. Configure SSH Access
1. Generate SSH key pair (if not already done):
```bash
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

2. Copy your public key to the remote NVIDIA instance:
```bash
ssh-copy-id user@remote-nvidia-instance-ip
```

3. Update the SSH config file (`ssh/config`) with your remote instance details.

### 3. Install VS Code Remote SSH Extension
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Remote SSH" and install it
4. Reload VS Code if prompted

### 4. Connect to Remote Instance
1. Open Command Palette (Ctrl+Shift+P)
2. Type "Remote-SSH: Connect to Host..."
3. Select your configured host from the SSH config
4. Choose platform when prompted (Linux)

### 5. Run Remote Setup Script
Once connected to the remote instance via VS Code:
```bash
chmod +x setup/remote-setup.sh
./setup/remote-setup.sh
```

### 6. Configure NVIDIA Licensing
The setup script will automatically configure the NVIDIA licensing server. Verify the configuration:
```bash
nvidia-smi -q | grep "License Status"
```

## Project Structure

```
.
├── README.md                    # This file
├── ssh/
│   └── config                   # SSH configuration for easy connection
├── vscode/
│   └── settings.json           # VS Code workspace settings
├── setup/
│   └── remote-setup.sh         # Remote machine setup script
├── cuda-samples/
│   ├── Makefile               # Build configuration
│   ├── vectorAdd.cu           # Sample CUDA program
│   └── README.md              # Sample project documentation
└── .vscode/
    └── settings.json          # Local VS Code settings
```

## Detailed Setup Instructions

### SSH Configuration
Edit `ssh/config` with your remote instance details:
```
Host nvidia-gpu
    HostName YOUR_INSTANCE_IP
    User YOUR_USERNAME
    IdentityFile ~/.ssh/id_rsa
    ForwardAgent yes
    ForwardX11 yes
```

### Remote Machine Setup
The `setup/remote-setup.sh` script will:
- Install NVIDIA drivers
- Install CUDA toolkit
- Configure licensing server
- Install development tools (gcc, make, etc.)
- Set up environment variables

### VS Code Configuration
The workspace includes optimized settings for:
- CUDA syntax highlighting
- Remote development
- GPU debugging capabilities
- IntelliSense for CUDA C/C++

### Testing the Setup
1. Connect to remote instance via VS Code
2. Open the `cuda-samples` folder
3. Build and run the sample:
```bash
cd cuda-samples
make
./vectorAdd
```

## Troubleshooting

### Connection Issues
- Verify SSH key is properly copied to remote instance
- Check firewall settings allow SSH (port 22)
- Ensure remote instance is running and accessible

### GPU Not Detected
- Run `nvidia-smi` to check GPU status
- Verify drivers are installed: `nvidia-smi -q`
- Check licensing status: `nvidia-smi -q | grep License`

### CUDA Build Issues
- Ensure CUDA toolkit is properly installed
- Check environment variables: `echo $CUDA_HOME`
- Verify compiler compatibility

### Licensing Problems
- Confirm licensing server URL is correct
- Check network connectivity to licensing server
- Verify license is active and not expired

## Performance Optimization

### Network Configuration
- Use high-bandwidth network connection
- Consider using VPN for secure connections
- Enable compression in SSH config: `Compression yes`

### VS Code Settings
- Enable file watching for large projects
- Configure remote extension host for better performance
- Use workspace settings for project-specific configurations

### GPU Utilization
- Monitor GPU usage with `nvidia-smi`
- Use `nvtop` for real-time GPU monitoring
- Optimize CUDA kernel launches for your specific workload

## Security Considerations

- Use strong SSH keys (4096-bit RSA or Ed25519)
- Regularly rotate SSH keys
- Keep NVIDIA drivers and CUDA toolkit updated
- Monitor access logs on remote instance
- Use firewall rules to restrict access

## Support

For issues with:
- NVIDIA licensing: Contact NVIDIA support
- VS Code remote development: Check VS Code documentation
- CUDA development: Refer to NVIDIA CUDA documentation
- SSH configuration: Consult SSH documentation

## License

This setup is provided as-is for educational and development purposes.