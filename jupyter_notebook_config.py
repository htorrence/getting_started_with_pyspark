c = get_config()
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888

from IPython.lib import passwd
c.NotebookApp.password = passwd("pyspark")
