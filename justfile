default:
    stow .
    gitleaks detect --source .

update: update-yazi

update-yazi:
    ya pack --upgrade
