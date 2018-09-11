
import unittest
import requests
import re
import responses
import json
import logging
import sys

if __name__ == '__main__':
    log = logging.getLogger()
    log.level = logging.DEBUG
    log.addHandler(logging.StreamHandler(sys.stderr))
else:
    log = logging.getLogger(__name__)

log.info('PASS')
log.debug('Something about %r in %s', log, __name__)

url = 'https://jsonplaceholder.typicode.com/'


class JsonPlaceholderTests(unittest.TestCase):

    def test_post_body(self):
        logging.info('[TEST POST BODY]')
        response = requests.get(url + 'posts/1')
        value = "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        self.assertEqual(response['body'], value)
        logging.info('[PASS]')


if __name__ == '__main__':
    unittest.main()
