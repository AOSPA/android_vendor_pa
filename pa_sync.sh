time repo sync --current-branch --no-tags --no-clone-bundle --force-sync --force-broken --detach $(repo manifest | grep "AOSPA/" | grep -oP 'name="\K[^"\047]+(?=["\047])')
