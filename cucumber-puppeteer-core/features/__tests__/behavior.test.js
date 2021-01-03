const { defineFeature, loadFeature } = require("jest-cucumber");
const puppeteer = require("puppeteer-core");
const { toMatchImageSnapshot } = require("jest-image-snapshot");
const feature = loadFeature(
  "./cucumber-puppeteer-core/features/behavior.feature"
);

defineFeature(feature, (test) => {
  expect.extend({ toMatchImageSnapshot });

  test("提供產品資訊", ({ given, when, then }) => {
    let browser;
    let page;

    beforeAll(async () => {
      browser = await puppeteer.launch({
        headless: false,
        executablePath:
          "C:/Program Files (x86)/Google/Chrome/Application/Chrome.exe",
        args: ["--proxy-server=192.168.201.201:3128"],
      });
    });

    beforeEach(async () => {
      page = await browser.newPage();
      await page.setViewport({ width: 1920, height: 1200 });
      await page.goto("http://localhost:3000");
    });

    afterAll(async () => {
      await page.close();
      await browser.close();
    });

    given("列表是珠寶類", async () => {
      const clickStep01 = '//*[@id="root"]/div/div[4]/div[1]/div[3]';
      const clickStep02 = '//*[@id="root"]/div/div[7]/div/div[2]/div[1]/div[1]';

      await page.waitForXPath(clickStep01);
      const [element01] = await page.$x(clickStep01);
      await page.waitForXPath(clickStep02);
      const [element02] = await page.$x(clickStep02);

      await page.evaluate((element) => element.click(), element01);
      let text = await page.evaluate((element) => {
        element.click();
        return window.getComputedStyle(element).getPropertyValue("color");
      }, element02);
      console.log(text);
      // element01.then((element) => element[0].click());
      // element02.then((element) => element[0].click());
    });
  });
});
