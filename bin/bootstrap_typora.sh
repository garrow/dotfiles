

echo "Current State"
defaults read abnerworks.Typora NSUserKeyEquivalents


    # COMMAND1 = "@1";
    # "cmd-alt-1" = "@~1";
    # "cmd-ctrl-1" = "@^1";
    # "cmd-shift-1" = "@$1";


# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 1" -string '@~1'
# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 2" -string '@~2'
# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 3" -string '@~3'
# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 4" -string '@~4'
# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 5" -string '@~5'
# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Heading 6" -string '@~6'

defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Ordered List" -string '@$7'
defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Unordered List" -string '@$8'
defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Task List" -string '@$9'


# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Paragraph" -string '@~0'






# defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Ordered List" -string '@$7'
# # defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Ordered List" -string '@$7'
# # defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Ordered List" -string '@$7'
# # defaults write abnerworks.Typora NSUserKeyEquivalents -dict-add "Ordered List" -string '@$7'


echo "Final State"
defaults read abnerworks.Typora NSUserKeyEquivalents

# Common actions

# Copy	⌘ + C
# Cut	X
# Paste	⌘ + V
# Paste without formatting	⌘ + Shift + V
# Undo	⌘ + z
# Redo	Shift + Z
# Insert or edit link	⌘ + K
# Open link	Option + Enter
# Show common keyboard shortcuts	⌘ + /
# Save
# Every change is automatically saved in Drive	⌘ + S
# Print	⌘ + P
# Open	⌘ + O
# Find	⌘ + F
# Find and replace	⌘ + Shift + H
# Find again	⌘ + G
# Find previous	⌘ + Shift + G
# Hide the menus (compact mode)	Ctrl + Shift + F
# Insert page break	⌘ + Enter
# Tool finder (formerly Search the menus)	Option + /
# Ctrl + Option + Z
# Repeat last action	⌘ + Y
# Switch to editing	⌘ + Option + Shift + Z
# Switch to suggesting	⌘ + Option + Shift + X
# Switch to viewing	⌘ + Option + Shift + C
# Text formatting

# Bold	⌘ + B
# Italicise	⌘ + I
# Underline	⌘ + U
# Strikethrough	⌘ + Shift + X
# Superscript	⌘ + .
# Subscript	⌘ + ,
# Copy text formatting	⌘ + Option + C
# Paste text formatting	⌘ + Option + V
# Clear text formatting	⌘ + \
# Increase font size	⌘ + Shift + .
# Decrease font size	⌘ + Shift + ,
# Paragraph formatting

# Increase paragraph indentation	⌘ + ]
# Decrease paragraph indentation	⌘ + [
# Apply normal text style	⌘ + Option + 0
# Apply heading style [1-6]	⌘ + Option + [1-6]
# Left align	⌘ + Shift + L
# Centre align	⌘ + Shift + E
# Right align	⌘ + Shift + R
# Justify	⌘ + Shift + J
# Numbered list	⌘ + Shift + 7
# Bulleted list	⌘ + Shift + 8
# Checklist	⌘ + Shift + 9
# Move paragraph up/down	Ctrl + Shift + Up/Down arrow
# Images and drawings

# Alt text	⌘ + Option + Y
# Resize larger	⌘ + Ctrl + K
# Resize larger horizontally	⌘ + Ctrl + B
# Resize larger vertically	⌘ + Ctrl + I
# Resize smaller	⌘ + Ctrl + J
# Resize smaller horizontally	⌘ + Ctrl + W
# Resize smaller vertically	⌘ + Ctrl + Q
# Rotate clockwise by 15°	Option + Right arrow
# Rotate anticlockwise by 15°	Option + Left arrow
# Rotate anticlockwise by 1°	Option + Shift + Left arrow
# Rotate clockwise by 1°	Option + Shift + Right arrow
# Close drawing editor	⌘ + Esc
# Shift + Esc
# Comments and footnotes

# Insert comment	⌘ + Option + M
# Open discussion thread	⌘ + Option + Shift + A
# Enter current comment	holding Ctrl + ⌘, press E then C
# Insert footnote	⌘ + Option + F
# Move to current footnote	holding Ctrl + ⌘, press E then F
# Move to next footnote	holding Ctrl + ⌘, press N then F
# Move to previous footnote	holding Ctrl + ⌘, press P then F
# Move to next suggestion	holding Ctrl + ⌘, press N then U
# Move to previous suggestion	holding Ctrl + ⌘, press P then U
# Review suggested edits	holding Ctrl + ⌘, press O then U
# Move to next comment	holding Ctrl + ⌘, press N then C
# Move to previous comment	holding Ctrl + ⌘, press P then C
# Open comment history	⌘ + Option + Shift + A
# Use keyboard shortcuts on selected comments

# Reply to current comment	R
# Move to next comment	J
# Move to previous comment	K
# Resolve current comment	E
# Exit current comment	U
# Menus

# Context (right-click) menu	
# ⌘ + Shift + \
# Shift + F10

# File menu	Ctrl + Option + F
# Edit menu	Ctrl + Option + E
# View menu	Ctrl + Option + V
# Insert menu	Ctrl + Option + I
# Format menu	Ctrl + Option + O
# Tools menu	Ctrl + Option + T
# Help menu	Ctrl + Option + H
# Accessibility menu
# (present when screen reader support is enabled)	Ctrl + Option + A
# Input Tools menu
# (available in documents in non-Latin languages)	⌘ + Option + Shift + K
# Toggle input controls
# (available in documents in non-Latin languages)	⌘ + Shift + K
# Show your browser's context menu	Shift + right-click
# Text selection with keyboard

# Select all	⌘ + A
# Select none	holding Ctrl + ⌘, press U, then A
# Extend selection one character	Shift + Left/Right arrow
# Extend selection one line	Shift + Up/Down arrow
# Extend selection to the beginning of the line	Shift + Fn + Left arrow
# Extend selection one paragraph	Option + Shift + Up/Down arrow
# Extend selection to the end of the line	Shift + Fn + Right arrow
# Extend selection to the beginning of the document	⌘ + Shift + Up arrow
# Extend selection to the end of the document	⌘ + Shift + Down arrow
# Select current list item	holding Ctrl + ⌘ + Shift, press E then I
# Select all list items at current level	Holding Ctrl + ⌘ + Shift, press E then O
# Select multiple sections of text	After selecting one section of text, Ctrl + ⌘ + Shift + Left/right arrow. Use left/right arrow to move to a separate section of text that you also want to select.
# Text selection with mouse

# Select word	Double-click
# Extend selection one word at a time	Double-click + drag
# Select paragraph	Triple-click
# Extend selection one paragraph at a time	Triple-click + drag