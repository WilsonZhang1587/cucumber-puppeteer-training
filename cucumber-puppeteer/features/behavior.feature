# ProductList || ProductItem
Feature: 產品資訊

Scenario: 提供產品資訊
  Given 列表是珠寶類
  When  我進入產品列表頁
  And   點選任一產品
  Then  應該進入該產品頁
  And   點選產品描述應該看到產品資訊