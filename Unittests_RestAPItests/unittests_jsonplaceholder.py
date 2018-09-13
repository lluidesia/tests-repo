
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
    def test_request_get(self):
        logging.info('[TEST GET]')
        response = requests.get(url)
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_get_posts(self):
        logging.info('[TEST GET POSTS]')
        response = requests.get(url+'posts/1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_get_posts_comments(self):
        logging.info('[TEST GET POSTS COMMENTS]')
        response = requests.get(url+'posts/1/comments')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_get_comments_postId(self):
        logging.info('[TEST GET COMMENTS POSTID]')
        response = requests.get(url+'comments?postId=1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_get_posts_userId(self):
        logging.info('[TEST GET POSTS USERID]')
        response = requests.get(url+'posts?userId=1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_post(self):
        logging.info('[TEST POST]')
        post_urn = url + 'posts'
        post_info = {'body': 'Test', 'userId': 1, 'title': 'Test'}
        response = requests.post(post_urn, data=json.dumps(post_info))
        #print(response.json())
        self.assertEqual(response.status_code, 201)
        logging.info('[PASS]')

    def test_request_delete(self):
        logging.info('[TEST DELETE]')
        response = requests.delete(url+'posts/1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_put(self):
        logging.info('[TEST PUT]')
        response = requests.put(url + 'posts/1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

    def test_request_patch(self):
        logging.info('[TEST PATCH]')
        response = requests.patch(url + 'posts/1')
        self.assertEqual(response.status_code, 200)
        logging.info('[PASS]')

# negative tests
    def test_request_get_negative(self):
        logging.info('[TEST GET NEGATIVE]')
        response = requests.get(url + 'posts/-1')
        self.assertEqual(response.status_code, 404)
        logging.info('[PASS]')

    def test_request_post_negative(self):
        logging.info('[TEST POST NEGATIVE]')
        response = requests.post(url + 'posts/-1')
        self.assertEqual(response.status_code, 404)
        logging.info('[PASS]')

    def test_request_put_negative(self):
        logging.info('[TEST PUT NEGATIVE]')
        response = requests.put(url + 'posts/-11')
        self.assertEqual(response.status_code, 404)
        logging.info('[PASS]')

    def test_request_patch_negative(self):
        logging.info('[TEST PATCH NEGATIVE]')
        response = requests.patch(url + 'posts/-11')
        self.assertEqual(response.status_code, 404)
        logging.info('[PASS]')

    def test_request_delete_negative(self):
        logging.info('[TEST DELETE NEGATIVE]')
        response = requests.delete(url + 'posts/-1')
        self.assertEqual(response.status_code, 404)
        logging.info('[PASS]')

    #new tests. Need to check request values

    def test_post_body(self):
        logging.info('[TEST POST BODY]')
        response = requests.get(url + 'posts/1')
        value = "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        self.assertEqual(response['body'], value)
        logging.info('[PASS]')


if __name__ == '__main__':
    unittest.main()
