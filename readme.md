<h1>Web App Otomasyon Projesi</h1>
Bu proje web uygulaması otomasyonunu içermektedir. 
<h2>Tool stack</h2>

* Ruby
* Selenium
* Capybara
* Cucumber
* RSpec
* RubyMine

<h3>Kurulum</h3>
* Ruby kurulumu yapılmış olmalıdır. <a href="https://www.ruby-lang.org/en/downloads/">Link to install</a>

* Browserlara ait driverlar indirilmiş olmalıdır. <a href="https://chromedriver.chromium.org/downloads">chromedriver</a> <a href="https://github.com/mozilla/geckodriver/releases">firefox driver</a>

* İndirilen driverlar bir klasöre atılmalı ve bu klasör environment variable a eklenmelidir.
* Proje locale clonlanır.

* Gerekli kütüphanelerin yüklenilebilmesi için, proje dizininde ```bundle install``` command i çalıştırılır.

* Tüm kütüphaneleri indirdikten sonra ``cucumber`` komutuyla proje çalıştırılır.

* Belirli bir feature dosyasını çalıştırmak için ``cucumber features/tests/payment.feature`` komutuyla feature çalıştırılır.

<h3>Proje yapısı</h3>

```
.
├── cucumber-report
│   ├── result
│   │   ├── report.json
│   ├── screenshots
├── features
│   ├── config
│   │   ├── base_config.rb
│   ├── data
│   │   ├── credit_card_data.rb
│   │   ├── test_information_data.rb
│   ├── helper
│   │   ├── page_helper.rb
│   ├── pages
│   │   └── home_page.rb
│   │   └── information_page.rb
│   │   └── payment_page.rb
│   │   └── search_page.rb
│   ├── step_definitions
│   │   └── homepage_steps.rb
│   │   └── information_steps.rb
│   │   └── payment_steps.rb
│   │   └── search_steps.rb
│   ├── support
│   │   ├── drivers.rb
│   │   └── env.rb
│   ├── tests
│   │   └── payment.feature
│   │   └── search.feature
│   └── utils
│       ├── general_utils.rb
├── cucumber.yml
├── gemfile
└── gemfile.lock
```
	

<h4>Result folder</h4>
Test sonuçlarını içeren dosyalar burada tutulacaktır.
<h4>Screenshots folder</h4>
Test çalıştırmaları sırasında alınan ekran görüntüleri burada tutulacaktır.
<h4>Config folder</h4>
Burada projeye ait configürasyonlar tutulacaktır.
<h4>Data folder</h4>
Burada projede kullanılacak bilgiler(kimlik,kredi kartı) tutulacaktır.
<h4>Helper folder</h4>
Step definition’larına veya test senaryolarına yardımcı olacak yeniden kullanılabilir metodların yer aldığı dosyalar burada tutulacaktır.
<h4>Pages Folder</h4>
Burası projedeki Page Object Model implementasyonu için kullanılacaktır.
<h4>Step_definitions folder</h4>
Senaryolara ait step tanımlamalarının yapıldığı yer bu klasör olacaktır.
<h4>Support folder</h4>
Drivers ve gerekli diğer env tanımlamalarının yapıldığı yer bu klasör olacaktır.
<h4>Tests folder</h4>
Feature filelar yani BDD formatındaki test caseler bu klasör altında yer alacaktır.
<h4>Utils Folder</h4>
Projeye ait utils class ve metodlar bu klasör içerisinde tanımlanacaktır.
<h4>Cucumber.yml</h4>
Cucumber için yapılandırma ayarlarını içeren dosyadır.
<h4>Gemfile</h4>
Projenin gerekli kütüphanelerinin yüklenilmesi için gerekli olan file.


<h2>Senaryo Yazımı</h2>

* Senaryolar feature file içerisine yazılacaktır.
* ``Given, When, Then, And`` Syntax i kullanılacaktır.
* Feature file başlangıcında ``Feature`` keywordunden sonra ilgili feature ın isimlendirmesi yapılacaktır.
* Bir sonraki satırda feature in açıklaması yazılacaktır.
* Senaryolar ``Scenario`` keywordunden sonra yazılacaktır. Senaryo name unique olmalıdır.
* Senaryo stepleri yazılırken aşağıdaki örnek senaryo takip edilecektir.

```
Given ön koşul
And ek koşul varsa
When aksiyonun alındığı kısım 
Then ilgili verifikasyonların yapıldığı yer
```

<h5>Örnek</h5>

```

Given homepage is opened

And clicks on login button

And fill the valid credentials

When clicks on login button

Then user should see my account icon

```

