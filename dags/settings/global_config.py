import os

# DAG_PATH is the path of your DAG file, and located by the path of this file.
# You should make sure this file is in some relative path like "dags/settings/global_config.py"
DAG_PATH = os.path.join(os.path.dirname(__file__), "..")

# DATA_PATH is the path of your temporary data file storage.
DATA_PATH = os.path.join(DAG_PATH, "..", "data")

# HTTPS_PROXY_ENABLED controls whether to use the proxy.
# If you are in a company network or in high security environment, you may need to set this to True.
HTTPS_PROXY_ENABLED = False

# If you need to use the proxy, you should set the proxy address here.
# The format should be like "{ip}:{port}"
if HTTPS_PROXY_ENABLED:
    PROXIES = {"http": "{ip}:{port}", "https": "{ip}:{port}"}
else:
    PROXIES = None

# READY_DATA_DB_URI is the URI of the database where you want to store the data.
# The format should be like "postgresql://{username}:{password}@{ip}:{port}/{database_name}"
#   if you use PostgreSQL.
READY_DATA_DB_URI = "postgresql://{username}:{password}@{ip}:{port}/{database_name}"
