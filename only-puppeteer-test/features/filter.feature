# ProductList || ProductItem
Feature: 篩選功能

Scenario Outline: 使用搜尋Bar搜尋產品
  Given 搜尋Bar輸入搜尋款號: <關鍵字>
  And   選擇搜尋範圍: <搜尋範圍>
  When  我按下鍵盤上(mobile)的'search按鍵'或是'放大鏡按鍵'
  Then  產品列表列出相關產品
 
  Examples:
 
  | 關鍵字 | 搜尋範圍 |
  | 01257 | 珠寶 |
  | W-RX | 手錶 |

Scenario Outline: 使用產品選項篩選產品(款號)
  Given 點選'產品選項'
  And   點選'款號'
  When  我在左邊的輸入框輸入: <款號1>
  When  我在右邊的輸入框輸入: <款號2>
  When  我按下鍵盤上的'search按鍵'或是'放大鏡按鍵'
  Then  產品列表列出此範圍的相關產品
 
  Examples:
 
  | 款號1 | 款號2 |
  | 01257 | 02257 |
  | 91576 ||

Scenario Outline: 使用產品選項篩選產品(用途)
  Given 點選'產品選項'
  And   點選'用途'
  When  我勾選: <用途1>
  When  我勾選: <用途2>
  When  我按下按下'確定'按鈕
  When  我按下'顯示匹配產品'按鈕
  Then  產品列表列出相關產品
 
  Examples:
 
  | 用途1  | 用途2 |
  | 手鍊   | |
  | 手鍊   | 配飾 |

Scenario Outline: 使用產品選項篩選產品(存貨價格)
  Given 點選'產品選項'
  And   點選'存貨價格'
  When  我滑動選擇: <價格1>
  When  我滑動選擇: <價格2>
  When  我按下按下'確定'按鈕
  When  我按下'顯示匹配產品'按鈕
  Then  產品列表列出相關產品
 
  Examples:
 
  | 價格1  | 價格2 |
  | 3000   | 6000 |
  | 6000   | 6000 |  

@ProductList
Scenario Outline: 使用產品排序排序產品
  Given 點選'產品排序' 
  When  我點選: <排序方式>
  Then  產品列表列依據'排序方式'排列相關產品
 
  Examples:
 
  | 排序方式 |
  | 貨量多至少 |
  | 款號大至小 |

@ProductList
Scenario Outline: 使用頁面跳轉換頁
  Given 點選'頁面跳轉' 
  When  我點選: <第幾頁>
  Then  產品列表列依據頁數顯示相關產品
 
  Examples:
 
  | 排序方式 |
  | 2 |
  | 最後一頁 |

Scenario Outline: 使用全部貨類搜尋商品
  Given 點選'全部貨類' 
  When  我點選: <貨類>
  And   點選設計分類底下的: <設計分類> 
  But   保留原本已存在篩選條件
  Then  搜尋Bar自動帶入'貨類'和'設計分類'的搜尋條件 
  And   產品列表依據搜尋結果顯示相關產品
 
  Examples:
 
  | 貨類 | 設計分類 |
  | 珠寶 | 字母 |
  | 手錶 | 設計1 |   