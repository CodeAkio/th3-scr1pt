# About

th3-scr1pt is a collection of scripts designed to simplify and automate the **pen-test** process. The goal of th3-scr1pt is to abstract the complexity of advanced tools like **Nmap**, **Metasploit**, and others, providing intuitive and standardized scripts. With th3-scr1pt, you focus on the **objective** of the task rather than dealing directly with complex parameters from those tools.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Directory Structure](#directory-structure)
- [Contributing](#contributing)

## Installation

1. Clone this repository:

    ```bash
   git clone https://github.com/CodeAkio/th3-scr1pt.git
   cd th3-scr1pt
   ```
2. Run the `setup.sh` script at the root of the project to set up the required environment:

    ```bash
    ./setup.sh
    ```
The `setup.sh` script will configure all necessary dependencies and ensure that the scripts are ready for use.

## Usage

After installation, you can use any pre-made script from the `scripts/` folder. The scripts are standardized to make usage easier, focusing on common actions during the pen-test process.

Example:

To check the open ports of an application, simply run the following command:

    ```bash
    ./scripts/scan/check_open_ports.sh <IP or domain>
    ```

This script automates the process and utilizes underlying tools transparently, simplifying your task.

## Directory Structure

```bash
th3-scr1pt/
├── setup.sh          # Script to set up the environment
├── utils/          # Common utilities for scripts
├── scripts/          # Collection of ready-to-use scripts
│   ├── scan/
│   │   ├── check_open_ports.sh
│   │   ├── scan_network.sh
│   │   └── ...
└── README.md         # Project documentation
```

## Contributing

Contributions are welcome! If you have ideas on how to improve th3-scr1pt or want to add new scripts, follow these steps:

1. Fork the project.
2. Create a new branch: `git checkout -b my-new-feature`
3. Make your changes and add commits: `git commit -m 'Add new feature'`
4. Push to your branch: `git push origin my-new-feature`
5. Open a Pull Request.
