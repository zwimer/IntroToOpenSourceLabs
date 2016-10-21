import unittest
from markdown_adapter import run_markdown

class TestMarkdownPy(unittest.TestCase):

    def setUp(self):
        pass
    
    def testOneOctothorpe(self):
        self.assertEqual(run_markdown('#OneOct'), '<p><h1>OneOct</h1></p>')
    
    def testTwoOctothorpe(self):
        self.assertEqual(run_markdown('##TwoOct'), '<p><h2>TwoOct</h2></p>')

    def testThreeOctothorpe(self):
        self.assertEqual(run_markdown('###ThreeOct'), '<p><h3>ThreeOct</h3></p>')

    def testBlockQuotes(self):
        lin2 = '<p><blockquote>Test' + '\n' + '</blockquote></p>'
        self.assertEqual(run_markdown('>Test'), lin2)

if __name__ == '__main__':
    unittest.main()

