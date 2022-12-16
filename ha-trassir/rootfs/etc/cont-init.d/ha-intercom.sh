#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: HA Trassir
# Configures HA Trassir
# ==============================================================================

# Ensure persistant storage exists
if ! bashio::fs.directory_exists "/data/ha-trassir"; then
    bashio::log.debug 'Data directory not initialized, doing that now...'

    # Setup structure
    mkdir -p /data/ha-trassir
    cp -R /var/www/ha-trassir/data /data/ha-trassir

    # Ensure file permissions
    chown -R nginx:nginx /data/ha-trassir
    find /data/ha-trassir -not -perm 0644 -type f -exec chmod 0644 {} \;
    find /data/ha-trassir -not -perm 0755 -type d -exec chmod 0755 {} \;
fi

bashio::log.debug 'Symlinking data directory to persistent storage location...'
rm -f -r /var/www/ha-trassir/data
ln -s /data/ha-trassir /var/www/ha-trassir/data