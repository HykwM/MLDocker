param(
    $Args0,
    $Args1
)


Get-Content ~/.ssh/id_rsa.pub | ssh $Args0@$Args1 `
"mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"