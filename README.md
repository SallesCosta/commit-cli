# CCM (Cody Commit Messages)

An interactive CLI that uses Cody AI to generate commit messages following the Conventional Commits standard. The script presents multiple message suggestions and allows you to choose the most appropriate one for your commit.

## Features

- 🤖 Cody AI integration for diff analysis
- 📝 Generates 5 message suggestions following Conventional Commits
- 🎨 Colorful and interactive CLI interface
- ✅ Git environment and changes validation
- 🧹 Automatic special character cleanup
- ❌ Robust error handling

## Prerequisites

- Git installed and configured
- Cody AI CLI installed and configured
- Terminal with color support (optional but recommended)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/sallescosta/ccm.git
```

2. Navigate to the project directory:
```bash
cd ccm
```

3. Give execution permission to the script:
```bash
chmod +x commit-cli.sh
```

4. Move the script to a directory in your PATH:
```bash
sudo mv commit-cli.sh /usr/local/bin/ccm
```

## How to Use

1. Navigate to your git project directory
2. Make your code changes
3. Run the command:
```bash
ccm
```
4. The script will:
   - Check if there are changes to commit
   - Generate 5 message suggestions using Cody
   - Present numbered options
   - Wait for your choice
5. Type the number of the desired message (1-5) or 'q' to quit
6. The script will automatically execute `git add .` and create the commit with the chosen message

## Usage Example

```bash
$ ccm

Commit message suggestions:
1. feat(auth): implement user authentication flow
2. fix(api): resolve connection timeout issues
3. refactor(core): optimize database queries
4. docs(readme): update installation instructions
5. style(ui): improve button component styling

Choose the number of the desired message (1-5) or 'q' to quit:
```


https://github.com/user-attachments/assets/eaa95f8b-9bc3-4ff7-896e-f30c7c7be8f5


## Contributing

Contributions are always welcome! Feel free to open issues and pull requests.

1. Fork the project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
