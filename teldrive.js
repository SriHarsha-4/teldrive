const fs = require('fs');
const path = require('path');

module.exports = async (req, res) => {
  try {
    // Reading the config.toml and session.db files from the root directory
    const configPath = path.resolve(process.env.CONFIG_PATH);
    const sessionPath = path.resolve(process.env.SESSION_PATH);

    // Read content from config.toml and session.db
    const config = fs.readFileSync(configPath, 'utf-8');
    const sessionData = fs.readFileSync(sessionPath, 'utf-8');

    // Respond with the config and session data
    res.status(200).json({ config, sessionData });
  } catch (error) {
    res.status(500).json({ error: 'Failed to read config or session data' });
  }
};
