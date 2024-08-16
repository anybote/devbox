#!/usr/bin/env bash

# overwrites bento's motd greeting with anybote's

rm -f /etc/update-motd.d/99-bento

cat > /etc/update-motd.d/99-anybote << EOF
#!/usr/bin/env bash

echo "Welcome to anybote's devbox."

EOF

chmod +x /etc/update-motd.d/99-anybote

run-parts /etc/update-motd.d > /dev/null

