# Local Development Setup for vscode-image-gallery

This guide helps developers set up a local environment to develop and test the vscode-image-gallery extension.

## Prerequisites
- **Node.js**: Version 18.x (recommended). Use [nvm for Windows](https://github.com/coreybutler/nvm-windows) for easy version management.
- **npm**: Comes with Node.js.
- **VS Code**: Latest stable version.
- **Git**: For cloning the repository.

## Setup Steps

1. **Clone the Repository**
   ```sh
   git clone https://github.com/geriyoco/vscode-image-gallery.git
   cd vscode-image-gallery
   ```

2. **Install Node.js 18.x (if not already installed)**
   ```sh
   nvm install 18.20.4
   nvm use 18.20.4
   ```

3. **Install Dependencies**
   ```sh
   npm install
   ```

4. **Start Development Build**
   ```sh
   npm run watch
   ```
   This runs webpack in watch mode for automatic rebuilds.

5. **Open in VS Code**
   - Open the project folder in VS Code.

6. **Run the Extension**
   - Press `F5` or go to the Run & Debug panel and click "Run Extension".
   - This opens a new VS Code window (Extension Development Host).

7. **Test the Extension**
   - Open an image file in the new window using the custom viewer.
   - Use and test new features as you develop.

## Notes from Recent Dev Experience

- If you see errors about missing Node.js versions, try installing Node 18.x with nvm and ensure you run `nvm use 18.20.4` before `npm install`.
- If you see TypeScript errors in the PROBLEMS window but not in the terminal, check for stale build artifacts or reload VS Code.
- The viewer now auto-refreshes images on file change by default—no checkbox or UI needed.
- To test auto-refresh, open an image in the Extension Development Host, then overwrite or edit the image file in your workspace. The viewer should update automatically.
- If you change the viewer's HTML or script, make sure `npm run watch` is running and reload the Extension Development Host window (Ctrl+R) to see changes.
- If you want to debug the webview, use the Command Palette in the Extension Development Host: `Developer: Open Webview Developer Tools`.
- For a minimal PR, keep changes focused on the viewer files and avoid unrelated formatting or style changes.

## Troubleshooting


For more details, see the project README or ask the maintainers.

## Using Your Custom Extension for Daily Use

If you want to use your updated extension (with your own features) every day, outside of development mode, follow these steps:

### 1. Build and Package the Extension

1. Open a terminal in the project root folder.
2. Run the following commands:

   npm install
   npm run compile
   npx vsce package

   - This will generate a `.vsix` file (e.g., `vscode-image-gallery-1.2.2.vsix`) in your project folder.

### 2. Install the .vsix in VS Code

1. Open Visual Studio Code.
2. Go to the Extensions view (Ctrl+Shift+X).
3. Click the three-dot menu (`...`) at the top right.
4. Select **Install from VSIX...**
5. Choose your generated `.vsix` file.

### 3. Use the Extension

- Your custom extension is now installed and will work like any other extension.
- If you update your code, repeat the steps above to generate and install a new `.vsix` file.

---

**Note:**
- You do not need to publish your extension to the marketplace to use it locally.
- You can uninstall or update your extension at any time from the Extensions view.
