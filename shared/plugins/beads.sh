export BEADS_DIR="${HOME}/.beads"

function setup_beads_local
{
  bd init  --stealth  --prefix local --skip-agents --skip-hooks
}
