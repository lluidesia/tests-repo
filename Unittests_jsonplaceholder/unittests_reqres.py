
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

url = 'https://reqres.in/'


class JsonPlaceholderTests(unittest.TestCase):
    def test_list_users(self):
        response = requests.get(url + 'api/users?page=2')

        logging.info('[TEST LIST USERS CODE]')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

        logging.info('[TEST LIST USERS PAGE]')
        self.assertEqual(response.json()['page'], 2)
        logging.info('[PASS]')

        logging.info('[TEST LIST USERS PER PAGE]')
        self.assertEqual(response.json()['per_page'], 3)
        logging.info('[PASS]')

        logging.info('[TEST LIST USERS TOTAL]')
        self.assertEqual(response.json()['total'], 12)
        logging.info('[PASS]')

        logging.info('[TEST LIST TOTAL PAGES]')
        self.assertEqual(response.json()['total_pages'], 4)
        logging.info('[PASS]')

        logging.info('[TEST LIST DATA USER 4]')
        self.assertEqual(response.json()['data'][0]['id'], 4)
        self.assertEqual(response.json()['data'][0]['first_name'], "Eve")
        self.assertEqual(response.json()['data'][0]['last_name'], "Holt")
        logging.info('[PASS]')

        logging.info('[TEST LIST DATA USER 5]')
        self.assertEqual(response.json()['data'][1]['id'], 5)
        self.assertEqual(response.json()['data'][1]['first_name'], "Charles")
        self.assertEqual(response.json()['data'][1]['last_name'], "Morris")
        logging.info('[PASS]')

        logging.info('[TEST LIST DATA USER 6]')
        self.assertEqual(response.json()['data'][2]['id'], 6)
        self.assertEqual(response.json()['data'][2]['first_name'], "Tracey")
        self.assertEqual(response.json()['data'][2]['last_name'], "Ramos")
        logging.info('[PASS]')



    def test_single_user(self):
        response = requests.get(url + 'api/users/2')

        logging.info('[TEST USER STATUS CODE]')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

        logging.info('[TEST USER ID]')
        self.assertEqual(response.json()['data']['id'], 2)
        logging.info('[PASS]')

        logging.info('[TEST USER FIRST NAME]')
        self.assertEqual(response.json()['data']['first_name'], "Janet")
        logging.info('[PASS]')

        logging.info('[TEST USER LAST NAME]')
        self.assertEqual(response.json()['data']['last_name'], "Weaver")
        logging.info('[PASS]')

    def test_single_resource(self):
        response = requests.get(url + 'api/unknown/2')

        logging.info('[TEST RESOURCE STATUS CODE]')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

        logging.info('[TEST RESOURCE ID]')
        self.assertEqual(response.json()['data']['id'], 2)
        logging.info('[PASS]')

        logging.info('[TEST RESOURCE NAME]')
        self.assertEqual(response.json()['data']['name'], "fuchsia rose")
        logging.info('[PASS]')

        logging.info('[TEST RESOURCE LAST YEAR]')
        self.assertEqual(response.json()['data']['year'], 2001)
        logging.info('[PASS]')

        logging.info('[TEST RESOURCE PANTONE VALUE]')
        self.assertEqual(response.json()['data']['pantone_value'], "17-2031")
        logging.info('[PASS]')




if __name__ == '__main__':
    unittest.main()
