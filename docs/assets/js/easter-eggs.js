/**
 * Interactive Portfolio Easter Eggs
 * Professional, discoverable, and accessible interactive elements
 */

(function() {
    'use strict';

    // Konami Code sequence: ↑↑↓↓←→←→BA
    const KONAMI_CODE = [
        'ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown',
        'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight',
        'KeyB', 'KeyA'
    ];

    // Terminal commands and responses
    const TERMINAL_COMMANDS = {
        'help': 'Available commands: about, skills, projects, contact, clear, matrix, coffee, whoami',
        'about': 'Senior Cloud Engineer specializing in Azure architectures and IaC. Coffee enthusiast and automation fanatic.',
        'skills': 'Azure | Terraform | Bicep | PowerShell | Python | DevOps | Security | Infrastructure as Code',
        'projects': 'Currently working on: ALZ-Bicep implementations, Azure Verified Modules, Zero Trust architectures',
        'contact': 'Email: contact@example.com | LinkedIn: linkedin.com/in/yourprofile | GitHub: github.com/ncasterism',
        'whoami': 'nat@cloudplayground:~$ You found the hidden terminal! 🎉',
        'coffee': '☕ Brewing coffee... Error: Coffee pot not found. Please install coffee.exe',
        'clear': null, // Special case for clearing terminal
        'matrix': '🔴 Taking the red pill... Welcome to the cloud matrix! 💊'
    };

    let konamiSequence = [];
    let developerModeActive = false;
    let terminalVisible = false;

    // Initialize Easter eggs
    function init() {
        setupKonamiCode();
        setupBadgeEffects();
        setupAzureAnimations();
        setupTerminalToggle();
        setupDiscoverabilityHints();
        
        // Add subtle hint for keyboard shortcuts
        addKeyboardHint();
    }

    // Konami Code Implementation
    function setupKonamiCode() {
        document.addEventListener('keydown', function(e) {
            konamiSequence.push(e.code);
            
            // Keep only the last 10 keys
            if (konamiSequence.length > KONAMI_CODE.length) {
                konamiSequence.shift();
            }
            
            // Check if sequence matches
            if (konamiSequence.length === KONAMI_CODE.length && 
                konamiSequence.every((key, index) => key === KONAMI_CODE[index])) {
                activateDeveloperMode();
                konamiSequence = []; // Reset sequence
            }
        });
    }

    // Developer Mode Activation
    function activateDeveloperMode() {
        if (developerModeActive) return;
        
        developerModeActive = true;
        
        // Add developer mode indicator
        const indicator = document.createElement('div');
        indicator.className = 'developer-mode-indicator';
        indicator.innerHTML = '🔧 Developer Mode Active';
        indicator.setAttribute('aria-live', 'polite');
        document.body.appendChild(indicator);
        
        // Enable advanced features
        enableAdvancedEffects();
        
        // Show achievement
        showAchievement('🎮 Konami Code Master!', 'You discovered the developer mode!');
        
        // Store achievement
        localStorage.setItem('portfolioAchievement_konami', 'true');
    }

    // Enhanced Badge Effects
    function setupBadgeEffects() {
        const badges = document.querySelectorAll('.certification-image, .archive__item img');
        
        badges.forEach(badge => {
            // Add loading error handling for better UX
            badge.addEventListener('error', function() {
                this.style.backgroundColor = 'var(--azure-blue)';
                this.style.display = 'flex';
                this.style.alignItems = 'center';
                this.style.justifyContent = 'center';
                this.style.color = 'white';
                this.style.fontSize = '2em';
                this.innerHTML = '🏆';
            });
            
            badge.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.1) rotate(5deg)';
                this.style.filter = 'drop-shadow(0 0 20px var(--azure-blue))';
                this.style.transition = 'all 0.3s ease';
                
                // Add pulse effect for Azure badges
                if (this.src.includes('azure') || this.alt.includes('Azure')) {
                    this.classList.add('azure-pulse');
                }
            });
            
            badge.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1) rotate(0deg)';
                this.style.filter = 'none';
                this.classList.remove('azure-pulse');
            });
            
            // Add click effect for surprise
            badge.addEventListener('click', function(e) {
                if (e.ctrlKey || e.metaKey) {
                    showAchievement('💎 Badge Collector!', 'You found a hidden badge interaction!');
                    localStorage.setItem('portfolioAchievement_badges', 'true');
                }
            });
        });
    }

    // Animated Azure Icons
    function setupAzureAnimations() {
        const azureElements = document.querySelectorAll('[src*="azure"], [alt*="Azure"], .btn--primary');
        
        azureElements.forEach(element => {
            // Add breathing animation class
            element.classList.add('azure-breathing');
            
            // Enhance on hover
            element.addEventListener('mouseenter', function() {
                this.classList.add('azure-enhanced');
            });
            
            element.addEventListener('mouseleave', function() {
                this.classList.remove('azure-enhanced');
            });
        });
    }

    // Hidden Terminal Emulator
    function setupTerminalToggle() {
        document.addEventListener('keydown', function(e) {
            // Ctrl+Shift+T or Cmd+Shift+T to toggle terminal
            if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'T') {
                e.preventDefault();
                toggleTerminal();
            }
            
            // Escape to close terminal
            if (e.key === 'Escape' && terminalVisible) {
                closeTerminal();
            }
        });
    }

    function toggleTerminal() {
        if (terminalVisible) {
            closeTerminal();
        } else {
            openTerminal();
        }
    }

    function openTerminal() {
        if (document.querySelector('.hidden-terminal')) return;
        
        terminalVisible = true;
        
        const terminal = document.createElement('div');
        terminal.className = 'hidden-terminal';
        terminal.innerHTML = `
            <div class="terminal-header">
                <span class="terminal-title">🔧 Portfolio Terminal v1.0</span>
                <button class="terminal-close" aria-label="Close terminal">×</button>
            </div>
            <div class="terminal-content">
                <div class="terminal-output">
                    <div class="terminal-line">Welcome to Nat's Cloud Portfolio Terminal!</div>
                    <div class="terminal-line">Type 'help' for available commands.</div>
                </div>
                <div class="terminal-input-line">
                    <span class="terminal-prompt">nat@cloudplayground:~$ </span>
                    <input type="text" class="terminal-input" placeholder="Enter command..." autocomplete="off">
                </div>
            </div>
        `;
        
        document.body.appendChild(terminal);
        
        // Focus input
        const input = terminal.querySelector('.terminal-input');
        input.focus();
        
        // Setup terminal interactions
        setupTerminalCommands(terminal);
        
        // Close button
        terminal.querySelector('.terminal-close').addEventListener('click', closeTerminal);
        
        // Show achievement on first use
        if (!localStorage.getItem('portfolioAchievement_terminal')) {
            showAchievement('💻 Terminal Hacker!', 'You discovered the hidden terminal!');
            localStorage.setItem('portfolioAchievement_terminal', 'true');
        }
    }

    function closeTerminal() {
        const terminal = document.querySelector('.hidden-terminal');
        if (terminal) {
            terminal.remove();
            terminalVisible = false;
        }
    }

    function setupTerminalCommands(terminal) {
        const input = terminal.querySelector('.terminal-input');
        const output = terminal.querySelector('.terminal-output');
        
        input.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                const command = this.value.trim().toLowerCase();
                this.value = '';
                
                // Add command to output
                const commandLine = document.createElement('div');
                commandLine.className = 'terminal-line terminal-command';
                commandLine.textContent = `nat@cloudplayground:~$ ${command}`;
                output.appendChild(commandLine);
                
                // Process command
                if (command === 'clear') {
                    output.innerHTML = '';
                } else if (TERMINAL_COMMANDS[command]) {
                    const responseLine = document.createElement('div');
                    responseLine.className = 'terminal-line terminal-response';
                    responseLine.textContent = TERMINAL_COMMANDS[command];
                    output.appendChild(responseLine);
                } else if (command) {
                    const errorLine = document.createElement('div');
                    errorLine.className = 'terminal-line terminal-error';
                    errorLine.textContent = `Command not found: ${command}. Type 'help' for available commands.`;
                    output.appendChild(errorLine);
                }
                
                // Scroll to bottom
                output.scrollTop = output.scrollHeight;
            }
        });
    }

    // Discoverability Hints
    function setupDiscoverabilityHints() {
        // Add subtle hint after user interaction
        let interactionCount = 0;
        
        document.addEventListener('click', function() {
            interactionCount++;
            
            if (interactionCount === 5 && !localStorage.getItem('portfolioHint_shown')) {
                showHint('💡 Tip: Try some keyboard shortcuts! There might be hidden features...');
                localStorage.setItem('portfolioHint_shown', 'true');
            }
        });
        
        // Show achievements panel after collecting some
        setTimeout(showAchievementsIfAny, 2000);
    }

    function addKeyboardHint() {
        const hint = document.createElement('div');
        hint.className = 'keyboard-hint';
        hint.innerHTML = '⌨️ Psst... Try some keyboard combinations!';
        hint.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--azure-blue);
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            font-size: 0.8em;
            opacity: 0.7;
            z-index: 1000;
            transition: opacity 0.3s ease;
            cursor: pointer;
        `;
        
        document.body.appendChild(hint);
        
        // Fade out after 5 seconds
        setTimeout(() => hint.style.opacity = '0.3', 5000);
        setTimeout(() => hint.style.display = 'none', 8000);
        
        hint.addEventListener('click', function() {
            this.style.display = 'none';
            showHint('🎮 Try the Konami Code: ↑↑↓↓←→←→BA or Ctrl+Shift+T for terminal!');
        });
    }

    // Advanced Effects (Developer Mode)
    function enableAdvancedEffects() {
        // Matrix rain effect on hover
        const heroSection = document.querySelector('.page__hero');
        if (heroSection) {
            heroSection.addEventListener('dblclick', startMatrixRain);
        }
        
        // Particle effects
        addParticleEffects();
    }

    function startMatrixRain() {
        if (document.querySelector('.matrix-rain')) return;
        
        const matrix = document.createElement('canvas');
        matrix.className = 'matrix-rain';
        matrix.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 999;
            opacity: 0.1;
        `;
        
        document.body.appendChild(matrix);
        
        // Simple matrix effect
        const ctx = matrix.getContext('2d');
        matrix.width = window.innerWidth;
        matrix.height = window.innerHeight;
        
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()';
        const drops = [];
        
        for (let i = 0; i < matrix.width / 10; i++) {
            drops[i] = 1;
        }
        
        const matrixInterval = setInterval(() => {
            ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
            ctx.fillRect(0, 0, matrix.width, matrix.height);
            
            ctx.fillStyle = '#0f0';
            ctx.font = '10px monospace';
            
            for (let i = 0; i < drops.length; i++) {
                const text = chars[Math.floor(Math.random() * chars.length)];
                ctx.fillText(text, i * 10, drops[i] * 10);
                
                if (drops[i] * 10 > matrix.height && Math.random() > 0.975) {
                    drops[i] = 0;
                }
                drops[i]++;
            }
        }, 33);
        
        // Remove after 5 seconds
        setTimeout(() => {
            clearInterval(matrixInterval);
            matrix.remove();
        }, 5000);
    }

    function addParticleEffects() {
        // Add floating particles to the page
        for (let i = 0; i < 20; i++) {
            setTimeout(() => createParticle(), i * 200);
        }
    }

    function createParticle() {
        const particle = document.createElement('div');
        particle.className = 'floating-particle';
        particle.innerHTML = ['⚡', '☁️', '🔧', '💻', '🚀'][Math.floor(Math.random() * 5)];
        particle.style.cssText = `
            position: fixed;
            font-size: 20px;
            pointer-events: none;
            z-index: 998;
            opacity: 0.3;
            left: ${Math.random() * window.innerWidth}px;
            top: ${window.innerHeight + 50}px;
            transition: transform 10s linear;
        `;
        
        document.body.appendChild(particle);
        
        // Animate upward
        setTimeout(() => {
            particle.style.transform = `translateY(-${window.innerHeight + 100}px) rotate(360deg)`;
        }, 100);
        
        // Remove after animation
        setTimeout(() => particle.remove(), 10000);
    }

    // Achievement System
    function showAchievement(title, description) {
        const achievement = document.createElement('div');
        achievement.className = 'achievement-notification';
        achievement.innerHTML = `
            <div class="achievement-content">
                <div class="achievement-title">${title}</div>
                <div class="achievement-description">${description}</div>
            </div>
        `;
        achievement.setAttribute('role', 'status');
        achievement.setAttribute('aria-live', 'polite');
        
        document.body.appendChild(achievement);
        
        // Animate in
        setTimeout(() => achievement.classList.add('show'), 100);
        
        // Remove after 4 seconds
        setTimeout(() => {
            achievement.classList.remove('show');
            setTimeout(() => achievement.remove(), 300);
        }, 4000);
    }

    function showHint(message) {
        const hint = document.createElement('div');
        hint.className = 'hint-notification';
        hint.textContent = message;
        hint.setAttribute('role', 'status');
        hint.setAttribute('aria-live', 'polite');
        
        document.body.appendChild(hint);
        
        setTimeout(() => hint.classList.add('show'), 100);
        setTimeout(() => {
            hint.classList.remove('show');
            setTimeout(() => hint.remove(), 300);
        }, 6000);
    }

    function showAchievementsIfAny() {
        const achievements = [];
        if (localStorage.getItem('portfolioAchievement_konami')) achievements.push('🎮 Konami Master');
        if (localStorage.getItem('portfolioAchievement_terminal')) achievements.push('💻 Terminal Hacker');
        if (localStorage.getItem('portfolioAchievement_badges')) achievements.push('💎 Badge Collector');
        
        if (achievements.length > 0) {
            const panel = document.createElement('div');
            panel.className = 'achievements-panel';
            panel.innerHTML = `
                <div class="achievements-header">🏆 Achievements (${achievements.length}/3)</div>
                <div class="achievements-list">
                    ${achievements.map(a => `<div class="achievement-item">${a}</div>`).join('')}
                </div>
                ${achievements.length === 3 ? '<div class="achievement-item special">🎉 Portfolio Explorer!</div>' : ''}
            `;
            
            document.body.appendChild(panel);
            
            // Celebration effect for all achievements
            if (achievements.length === 3 && !localStorage.getItem('portfolioAchievement_master')) {
                localStorage.setItem('portfolioAchievement_master', 'true');
                showAchievement('🏆 Portfolio Master!', 'You discovered all hidden features! You are a true explorer!');
                // Add confetti effect
                setTimeout(() => {
                    for (let i = 0; i < 50; i++) {
                        setTimeout(() => createConfetti(), i * 50);
                    }
                }, 1000);
            }
            
            // Auto-hide after 3 seconds
            setTimeout(() => panel.style.opacity = '0.3', 3000);
        }
    }

    function createConfetti() {
        const confetti = document.createElement('div');
        confetti.innerHTML = ['🎉', '🎊', '⭐', '✨', '🌟'][Math.floor(Math.random() * 5)];
        confetti.style.cssText = `
            position: fixed;
            font-size: 20px;
            pointer-events: none;
            z-index: 999;
            left: ${Math.random() * window.innerWidth}px;
            top: -50px;
            transition: all 3s ease-out;
        `;
        
        document.body.appendChild(confetti);
        
        // Animate confetti fall
        setTimeout(() => {
            confetti.style.transform = `translateY(${window.innerHeight + 100}px) rotate(${Math.random() * 360}deg)`;
            confetti.style.opacity = '0';
        }, 100);
        
        // Remove after animation
        setTimeout(() => confetti.remove(), 3100);
    }

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

})();