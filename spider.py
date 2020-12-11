import scrapy

class BlogSpider(scrapy.Spider):
    name = 'blogspider'
    start_urls = ['https://travel.com.vn/du-lich-da-lat.aspx']

    def parse(self, response):
        # count = 3
        # while count < 69: 
        # response = response.xpath('//*[@id="searchResult"]/div[4]/div/div[1]/div[{0}]'.format(3)).get()
        # count += 1
        images = response.xpath('//*[@id="searchResult"]/div[4]/div/div[1]/div[3]/div/div/div[2]/div/a/img').getall()
        print(images)

        # for next_page in response.css('a.next-posts-link'):
        #     yield response.follow(next_page, self.parse)
