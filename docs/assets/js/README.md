# Portfolio Easter Eggs Documentation

This document describes the interactive Easter eggs implemented in Nat's Cloud Portfolio.

## 🎮 Features Overview

### Konami Code Developer Mode
- **Trigger**: Type the sequence ↑↑↓↓←→←→BA
- **Effects**: 
  - Activates developer mode indicator
  - Enables floating particle effects
  - Unlocks matrix rain on double-click hero section
  - Shows achievement notification

### Hidden Terminal Emulator
- **Trigger**: Press `Ctrl+Shift+T` (or `Cmd+Shift+T` on Mac)
- **Close**: Press `Escape` or click X button
- **Available Commands**:
  - `help` - Show available commands
  - `about` - Personal bio information
  - `skills` - Technical skills summary
  - `projects` - Current project information
  - `contact` - Contact details
  - `whoami` - Fun response
  - `coffee` - Humorous coffee command
  - `matrix` - Matrix-themed response
  - `clear` - Clear terminal output

### Badge Hover Effects
- **Trigger**: Hover over certification badges
- **Special**: Ctrl+Click badges for achievements
- **Effects**: 
  - Scale and rotation animation
  - Azure blue glow for Azure badges
  - Pulse effect for enhanced interaction

### Azure Icon Animations
- **Automatic**: Subtle breathing animation on Azure-related elements
- **Enhanced**: Stronger effects in developer mode
- **Target Elements**: Buttons, badges, images with "azure" in name/alt text

## 🔧 Technical Implementation

### File Structure
```
docs/
├── assets/
│   ├── js/
│   │   └── easter-eggs.js          # Main Easter eggs functionality
│   └── css/
│       └── main.scss               # CSS animations and styling
├── _includes/
│   ├── easter-eggs.html            # Script include
│   └── head/
│       └── custom.html             # Head customizations
└── _layouts/
    ├── default.html                # Default layout with Easter eggs
    └── splash.html                 # Splash layout with Easter eggs
```

### Key Classes and IDs
- `.certification-image` - Badge hover effects
- `.btn--primary` - Button breathing animations
- `.azure-breathing` - Azure breathing animation class
- `.azure-pulse` - Pulse effect class
- `.developer-mode-indicator` - Developer mode UI
- `.hidden-terminal` - Terminal emulator interface

## 🎯 Accessibility Features
- ARIA live regions for screen readers
- Keyboard navigation support
- Reduced motion support (`prefers-reduced-motion`)
- High contrast mode compatibility
- Focus management for terminal

## 🔄 Browser Compatibility
- Modern browsers with ES6 support
- Progressive enhancement (works without JavaScript)
- Mobile responsive design
- Touch device support

## 🎨 Customization
- CSS variables for theming in `:root`
- Easy command addition in `TERMINAL_COMMANDS` object
- Configurable animation timings
- Achievement system with localStorage

## 🚀 Performance
- Lazy loading with DOM ready check
- Event delegation for efficiency
- Cleanup on element removal
- Optimized animations with CSS transforms

## 📝 Maintenance Notes
- Easter eggs are discoverable but not obtrusive
- All effects maintain professional appearance
- LocalStorage used for achievement persistence
- No external dependencies required