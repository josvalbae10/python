import logging
from Selenium2Library import Selenium2Library


TIMEOUT = 30

DEFAULT_USERNAME = 'protectdev1@gmail.com'
DEFAULT_PASSWORD = 'Workshare1!'


class WebAutomation(Selenium2Library):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        super(WebAutomation, self).__init__(timeout=15)

    def try_to_login(self, username=DEFAULT_USERNAME, password=DEFAULT_PASSWORD):
        retries = 3
        for _ in range(0, retries):
            try:
                self.input_text('name=email', username)
                self.input_text('name=password', password)
                login_button = super(WebAutomation, self).get_webelement('id=login')
                login_button.click()
                return
            except Exception as e:

                logging.warning(e.message)
                logging.warning('Something went wrong with login, retrying...')