from google_images_download import google_images_download as gd

import ssl

ssl._create_default_https_context = ssl._create_unverified_context


def imageCrawling(keyword, dir):
    reaponse = gd.googleimagesdownload()

    arguments = {'keywords': 웰시코기,
                 'limit': 1000,
                 'print_urls': True,
                 'chromedriver':'chromedriver.exe',
                 'no_directory': True,
                 'output_directory': dir}
    paths = reaponse.download(arguments)
    print(paths)

