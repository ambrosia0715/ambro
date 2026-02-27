'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8f13962cc044a28b6af4e2b8f5dcbfc8",
"rss.xml": "2719b945a479f6050c61b70add5c97ca",
"version.json": "cdf04dffada93455ab97eeb869fb3c31",
"index.html": "c519f17d2c0ff402c018f6165e230ddb",
"/": "c519f17d2c0ff402c018f6165e230ddb",
"googlea94504ee06fd1f79.html": "a05641cfd00dbb4dd8d30e1a72dd3670",
"about.html": "9de37afbdd25a03851e62a0a918d6d55",
"contact.html": "10c5c15e7116d8b96aeef6d401bbe296",
"main.dart.js": "c45ddb4a88047e8e98c81f5aca260fd7",
"ads.txt": "d23943dcf94ceab2656e40f349acbc8c",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"app-ads.txt": "cfcf8b649ad157aa579d90769dc3d84d",
"about/apps.html": "8fbd319d3edd9092b62b1f06253f20da",
"blog/python.html": "d8e119e1eee39a7136081431fcad8fa9",
"blog/ai-basic.html": "b804f65cf2ba5d33b8e0310ec39335b1",
"blog/python/pandas-basics.mdx": "cb412d539c325af6227bf8c49a1790ba",
"blog/python/fastapi-vs-flask.mdx": "c79e058b9cb9282b95525c2115aafa51",
"blog/python/asyncio-tutorial.mdx": "f8ba9a753bf5a985f3d027d43e661cf7",
"blog/python/decorator-generator.mdx": "97306ff17edf5a7c1e6789c5e951d6dd",
"blog/python/venv-management.mdx": "9f0bd258319041a73e31551f2ef6dcaf",
"blog/java/optional-guide.mdx": "fd0f2e7edbf458d1cd5cb7d4c6761166",
"blog/java/spring-vs-springboot.mdx": "91245726b0fd046411010d75b24434f1",
"blog/java/jvm-memory.mdx": "3ac169e3fcc1826ebfe8f1b811645ed1",
"blog/java/spring-basics.mdx": "b54e1ba7fef1926ad04b81ad5656a44a",
"blog/java/spring-boot-restful.mdx": "f639e77d617af895d6a1e778a8541d58",
"blog/java/spring-boot-guide.mdx": "1178a7d7d0efaf9ba09f96c2219ba2d2",
"blog/java/spring-framework-guide.mdx": "7d1574a73de79e38492c83d9c05e5c32",
"blog/java/java-multithreading.mdx": "02758f0af20285609159d01a50606dee",
"blog/java/modern-java-features.mdx": "7f3ab7df3235950478a81e65a5256ea6",
"blog/ai-insight/claude-4-opus.mdx": "df9d810ba2c7a52e8b94a4fd7962bc24",
"blog/ai-insight/ai-agent-trend.mdx": "5236ca112d9b25e348964e2a5952043b",
"blog/ai-insight/vector-db-guide.mdx": "5fd9b7bb1295b6e5107ee0aaff45ca36",
"blog/ai-insight/local-llm-security.mdx": "4826dade188f7ae2c1fbd90aba12fa8c",
"blog/ai-insight/gemini-31-pro.mdx": "476592e54450869ece77e5df7a11bcd9",
"blog/ai-insight/gpt-5-5-agentic.mdx": "708d487ce4e3029d038613612db8d576",
"blog/ai-insight/rag-strategy.mdx": "9edc871d3d58b0c1f545757602b9b466",
"blog/ai-insight/developer-future.mdx": "ef627a866b732d616d3ec34352f12da8",
"blog/ai-insight/openclaw-guide.mdx": "52b63af92925cb026a1badae46ac85f8",
"blog/ai-insight/nvidia-rubin-r100.mdx": "226149656ea0b8a009b879362052e2d3",
"blog/ai-basic/google-antigravity.mdx": "906a543d6a8850d8810ce4bffd480c78",
"blog/ai-basic/cursor-workflow.mdx": "511ae4f395216911f87eb8f3b63eb572",
"blog/ai-basic/v0-prototyping.mdx": "9bf71915476bcbe6da4631f1675d8c35",
"blog/ai-basic/llm-api-integration.mdx": "2a08d8b1e8b3c404327dce4e785674e1",
"blog/ai-basic/ai-unit-testing.mdx": "c9c73e8fe0a7bdf475387a978a356280",
"blog/ai-basic/vibe-coding.mdx": "60b6356ca4d5579b1ddecda2aa7c68ac",
"blog/ai-basic/ai-code-review.mdx": "54074b4e50d4c0397108e595d7de2efb",
"blog/java.html": "b0b2f77567952e182afbf5abf266844b",
"blog/ai-insight.html": "99610792daa75d25c91fa6313c2ac038",
"favicon.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-192.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-maskable-192.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-maskable-512.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-512.png": "d0c59f46dfdda82783cbf4f554571279",
"manifest.json": "2079d353a00e2ca410cafde3449910d4",
"sitemap.xml": "7d6437ae3ed5785e1965fda5b1895df7",
"robots.txt": "2882fb1915a32d28c8bb5a86dc97cef4",
"assets/AssetManifest.json": "86f2b686a9909296a95b1be6ec987ae6",
"assets/NOTICES": "160251faa0a9390d91d85b4d2857b4f0",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "9f1e202a0f7d0f475ba4a638a72b0f3a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "58c300c40cc1df17f377af2e9b4418b1",
"assets/fonts/MaterialIcons-Regular.otf": "891030b890d48973ac9ef3c332378831",
"assets/assets/images/pill_ping_logo.png": "f1adc69722020e75c2955cd28596e325",
"assets/assets/images/profile_photo.png": "5dbaa28ca0a697d431dc42944a040275",
"assets/assets/images/water_buddy_logo.png": "749b532e2028f5c7e1580210868f4f4c",
"assets/assets/images/blog/python_venv.webp": "647de6714cc5a60ebd77ac9ba061b458",
"assets/assets/images/blog/local_llm_security.webp": "e569d21b8cd6e059832fc1b4d5124eee",
"assets/assets/images/blog/developer_future.webp": "81b954745fddb3918b14f9761f996037",
"assets/assets/images/blog/antigravity_chrome_binary_path.png": "6cbc587da812c93d068cb35085ab9f3f",
"assets/assets/images/blog/v0_prototyping.webp": "71bc77c7d2a2ed8e2550cff780b60ef0",
"assets/assets/images/blog/ai_future_sec.webp": "ab700c5e0e5c708b0a327feff9954648",
"assets/assets/images/blog/nvidia_rubin_r100.webp": "bf515c947842992f774475f0caeebac9",
"assets/assets/images/blog/modern_java_evolution.webp": "e4f6c9facd1a496cb2d169cee60592f3",
"assets/assets/images/blog/cursor_ai.webp": "6acf768ddaf4ab7e2073942516af3fd7",
"assets/assets/images/blog/rag_architecture.webp": "52776ea88091ef1be7f31aba6b414703",
"assets/assets/images/blog/java_optional.webp": "5b5d60b0a3693b6823a8b2ea5ab9a536",
"assets/assets/images/blog/java_spring_modern.webp": "48252fbdb0d5f3716ce93ecb57350cce",
"assets/assets/images/blog/jvm_memory.webp": "06057019403eee564636b20ef7dd1918",
"assets/assets/images/blog/python_decorators.webp": "542447a01a47a6afaea496f18b9670c3",
"assets/assets/images/blog/spring_framework_hero.webp": "d613b202fec928b4af59961962b600db",
"assets/assets/images/blog/java_multithreading.webp": "867d912c7fa0e3248ddd5b06dca833b8",
"assets/assets/images/blog/gpt_5_5_agentic.webp": "82b4187142bd9892f0a07b709737ef68",
"assets/assets/images/blog/antigravity_enable_browser_tools.png": "e4a0304bc41ee8e52b96782647daf38a",
"assets/assets/images/blog/llm_api_integration.webp": "d32f42bbf108e661a19cfd89826e3b31",
"assets/assets/images/blog/google_antigravity.webp": "253c52f3b86250b750021493d929f672",
"assets/assets/images/blog/python_asyncio.webp": "2d5be380e6911967fa247c70ed47baea",
"assets/assets/images/blog/spring_vs_boot_hero.webp": "20f2e1b7c8e3df0ddb3647a664cfb9c5",
"assets/assets/images/blog/claude_4_opus.webp": "0387d22dda84e85eea1d43e2f9cf34f0",
"assets/assets/images/blog/ai_code_review.webp": "8f9c13b7ab67a5d433e80d0e6b1f95ee",
"assets/assets/images/blog/python_data_web.webp": "d987d39c293e526846edb05aa8c5a894",
"assets/assets/images/blog/ai_proto_test.webp": "cbbd562c3f4026cb28a4bc157450a9d3",
"assets/assets/images/blog/fastapi_vs_flask.webp": "4a876a10b5df48a608b6f63414b36131",
"assets/assets/images/blog/ai_unit_testing.webp": "762c8c5a7645b0a3da296cc0afefdea0",
"assets/assets/images/blog/gemini_31_pro.webp": "2a006f4912dd8ba4f3bc95c662e1a30a",
"assets/assets/images/blog/gemini_31_pro_benchmark.webp": "e04ca847f2ce0c8f2c23511a0a7cc6a3",
"assets/assets/images/blog/spring_boot_di.webp": "30d3f8d0e0599ed411ca58f81be30b1a",
"assets/assets/images/blog/ai_agents_trend.webp": "26447a7c70ea250e61142ffd8f76f39d",
"assets/assets/images/blog/openclaw_ai.webp": "2fd8101ff3b68612829a463fdcf26aaf",
"assets/assets/images/blog/vector_db_guide.webp": "f20fc3c41cbfc66d8291d432fe46418a",
"assets/assets/images/blog/spring_boot_rest.webp": "d26fd50d7a616b3df67033c8e046a4f9",
"assets/assets/images/blog/vibe_coding.webp": "d6652b1ed5fbf9282008af2bb36ef0de",
"assets/assets/images/blog/pandas_analysis.webp": "d52e40853f82f1d346c997bd0535eff2",
"assets/assets/images/blog/spring_boot_hero.webp": "f927add9c2e42a4689bd50e77df5e4e1",
"assets/assets/images/README.md": "21c428905b2e5ac938382c7ea1ffdca0",
"assets/assets/images/game_guessing_logo.png": "5f8fb5439aa18192fa3e9c6e6f954408",
"assets/assets/images/water_buddy_logo.png.txt": "15f5cb400f758440a089339ce026b7d7",
"assets/assets/images/ongi_logo.png": "70baab9718c1b8e4286a20bd92d1a108",
"assets/assets/images/ambro_CI.png": "c7e8cdaace2d0e51cf222a1ad957abe8",
"assets/assets/content/blog/python/pandas-basics.mdx": "a15ee7ef790be6cbe47d70918f825fb5",
"assets/assets/content/blog/python/fastapi-vs-flask.mdx": "e304a12c148095bc0a2700eef53f245b",
"assets/assets/content/blog/python/asyncio-tutorial.mdx": "4bcfee7738c1c7c2c54c2f4c43683440",
"assets/assets/content/blog/python/decorator-generator.mdx": "67d242bc5fb40a80322801f54f26d9d3",
"assets/assets/content/blog/python/venv-management.mdx": "a49fd45f11bf692798c286fd3de2c0a5",
"assets/assets/content/blog/java/optional-guide.mdx": "2da8a5c56e881c54c5b91b3da5a57484",
"assets/assets/content/blog/java/spring-vs-springboot.mdx": "19fbf66d7211a5c08a1f445aeeaf6b22",
"assets/assets/content/blog/java/jvm-memory.mdx": "45838bc245007117049bee7349659e8c",
"assets/assets/content/blog/java/spring-basics.mdx": "ef32ca7f51489f492e9c54b8c7003ba7",
"assets/assets/content/blog/java/spring-boot-restful.mdx": "1607a14b9e7bc156576cda2bae52275e",
"assets/assets/content/blog/java/spring-boot-guide.mdx": "bfb8e235bd87a1861eb259eb714e736a",
"assets/assets/content/blog/java/spring-framework-guide.mdx": "17672f8d281cdebca0f5a53ce0df7cd6",
"assets/assets/content/blog/java/java-multithreading.mdx": "2a2a01077dfe75f1f59dbdad02da4af4",
"assets/assets/content/blog/java/modern-java-features.mdx": "a6aafed7f841cd7e04e27ad6a637be8a",
"assets/assets/content/blog/ai-insight/claude-4-opus.mdx": "75a605ad10c7d49972199750a0f0ade1",
"assets/assets/content/blog/ai-insight/ai-agent-trend.mdx": "6a05ec2d326dee08b9d388bfdcf8946d",
"assets/assets/content/blog/ai-insight/vector-db-guide.mdx": "8ca645c221b5159600e81eca18d43cd7",
"assets/assets/content/blog/ai-insight/local-llm-security.mdx": "0cf4c7e7495b40fc3283713f4fec8287",
"assets/assets/content/blog/ai-insight/gemini-31-pro.mdx": "15cb44cb4ef4ead9b0375e148a518dff",
"assets/assets/content/blog/ai-insight/gpt-5-5-agentic.mdx": "66e1f54d0a62ee4d1163a998648789f5",
"assets/assets/content/blog/ai-insight/rag-strategy.mdx": "b77c46d9dece93ead3c5a794e073f4b9",
"assets/assets/content/blog/ai-insight/developer-future.mdx": "d2f3d9a1452acb0db15e7fe7ca6bf197",
"assets/assets/content/blog/ai-insight/openclaw-guide.mdx": "a4efbe06f8448c4a74d75efd63fd469d",
"assets/assets/content/blog/ai-insight/nvidia-rubin-r100.mdx": "c5c35b508d6564105d0a79e81881c1b4",
"assets/assets/content/blog/ai-basic/google-antigravity.mdx": "5c1b53ef520d0df2db58ce2412211897",
"assets/assets/content/blog/ai-basic/cursor-workflow.mdx": "3611bfde4ab2b8f0d5f4f2593cf18de9",
"assets/assets/content/blog/ai-basic/v0-prototyping.mdx": "10c7dfd53f798ad27d61940ff9da6d91",
"assets/assets/content/blog/ai-basic/llm-api-integration.mdx": "c072f94cd341143cf5a98ae2cd9900bd",
"assets/assets/content/blog/ai-basic/ai-unit-testing.mdx": "ec05fcf8e212e6e6d40e594060ae0eb1",
"assets/assets/content/blog/ai-basic/vibe-coding.mdx": "7400bba326f5f5e943f72eabbbbe9ee7",
"assets/assets/content/blog/ai-basic/ai-code-review.mdx": "1304d84c53156e7eac5aa8bc9f7e8723",
"privacy.html": "c2a778d1d0e0194e8c6d423d7efcbb73",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
