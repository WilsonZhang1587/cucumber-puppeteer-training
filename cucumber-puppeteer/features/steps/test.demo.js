import { defineFeature, loadFeature } from "jest-cucumber";
import puppeteer from "puppeteer";
import device from "puppeteer/DeviceDescriptors";
import { toMatchImageSnapshot } from "jest-image-snapshot";

const feature = loadFeature("./features/behavior.feature");

defineFeature(feature, (test) => {
  expect.extend({ toMatchImageSnapshot });
  test("Depositing a paycheck", ({ given, when, then }) => {
    const browser = await puppeteer.launch({
      headless: false,
      args: ["--proxy-server=192.168.201.201:3128"]
    });
    const page = await browser.newPage();
    await page.setViewport({ width: 1920, height: 1200 });
    await page.goto("http://localhost:3000");

    given(/^function add (\d+)$/, (int) => {
      
    
    });

    await page.close();
    await browser.close();
  });
});
