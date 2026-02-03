'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5af0d9a4ade6ec3ef35cacde795c72df",
"version.json": "cdf04dffada93455ab97eeb869fb3c31",
"index.html": "b2c35c79778a971c32f10c111ca03785",
"/": "b2c35c79778a971c32f10c111ca03785",
"main.dart.js": "1f39d0e8c36c351c0b99675cbf5f81f2",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"app-ads.txt": "cfcf8b649ad157aa579d90769dc3d84d",
"favicon.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-192.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-maskable-192.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-maskable-512.png": "d0c59f46dfdda82783cbf4f554571279",
"icons/Icon-512.png": "d0c59f46dfdda82783cbf4f554571279",
"manifest.json": "2079d353a00e2ca410cafde3449910d4",
"assets/web/app-ads.txt": "cfcf8b649ad157aa579d90769dc3d84d",
"assets/AssetManifest.json": "fdd40836dc31f8281f363eae4cabcc75",
"assets/NOTICES": "160251faa0a9390d91d85b4d2857b4f0",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "019dee3159cb16b5fc14d92bf84619ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e2ddd8932b46e311240f8dbc9886ba63",
"assets/fonts/MaterialIcons-Regular.otf": "bd4deadfd97c445f2b129b18341ecd02",
"assets/assets/images/pill_ping_logo.png": "f1adc69722020e75c2955cd28596e325",
"assets/assets/images/water_buddy_logo.png": "749b532e2028f5c7e1580210868f4f4c",
"assets/assets/images/blog/ai_code_review.png": "5e981962141da6ad13c8ce37ca292971",
"assets/assets/images/blog/rag_architecture.png": "f8047b5d19bad434636287c6cb616448",
"assets/assets/images/blog/java_spring_modern.png": "7d52e804b8487f444e6277e10e1511e8",
"assets/assets/images/blog/ai_unit_testing.png": "048808e23ba25c9763001d0d9026d598",
"assets/assets/images/blog/llm_api_integration.png": "348ae314061d8c6cb58b7d94c5ba6a82",
"assets/assets/images/blog/spring_boot_di.png": "3ccf450907fcbf685b30b07b28b0fd69",
"assets/assets/images/blog/jvm_memory.png": "677a0646259c6576347b35af3bc73485",
"assets/assets/images/blog/java_optional.png": "667f117164497cd3c7f84b4a9033ab62",
"assets/assets/images/blog/python_asyncio.png": "05306c1a22cf83a0591651ec5ea0e859",
"assets/assets/images/blog/python_venv.png": "5d8c6741f5424c223a636d89e3527790",
"assets/assets/images/blog/ai_proto_test.png": "7f75188a8ee7ba545b92ef455f9b2497",
"assets/assets/images/blog/ai_future_sec.png": "9121a89df3c8df4b9d22010785df9483",
"assets/assets/images/blog/modern_java_evolution.png": "d7c4e9203efd633bcfc04719a4e32747",
"assets/assets/images/blog/python_decorators.png": "e7edb61824bfe501fd8244acab4cc63d",
"assets/assets/images/blog/local_llm_security.png": "85f46c6a7d10c1d62fc8ce321147144b",
"assets/assets/images/blog/v0_prototyping.png": "2e5edd0c7ad2f956898345edb5c59423",
"assets/assets/images/blog/fastapi_vs_flask.png": "9abe9bd3f790ea7dd06e72adf3441639",
"assets/assets/images/blog/pandas_analysis.png": "454ef4d674b77700bfb8036ff9b17ada",
"assets/assets/images/blog/vector_db_guide.png": "fc37af2d6963e39cde99cf6c8db8ddb0",
"assets/assets/images/blog/developer_future.png": "35ab633f54656346d6e45e9ce6a90e42",
"assets/assets/images/blog/cursor_ai.png": "ff9043d94eccca22a58e01cf03ddc763",
"assets/assets/images/blog/java_multithreading.png": "4f89c840bbc1d30176dfdffa5ef709ad",
"assets/assets/images/blog/ai_agents_trend.png": "c111e304d093b64c6fe8afb690d57ab8",
"assets/assets/images/blog/python_data_web.png": "7fd2b21cce1bb33289fb3a75305109fa",
"assets/assets/images/README.md": "21c428905b2e5ac938382c7ea1ffdca0",
"assets/assets/images/game_guessing_logo.png": "5f8fb5439aa18192fa3e9c6e6f954408",
"assets/assets/images/water_buddy_logo.png.txt": "15f5cb400f758440a089339ce026b7d7",
"assets/assets/images/ongi_logo.png": "70baab9718c1b8e4286a20bd92d1a108",
"assets/assets/images/ambro_CI.png": "c7e8cdaace2d0e51cf222a1ad957abe8",
"assets/assets/content/blog/python/pandas-basics.mdx": "99b122335d10370b3acd4aa8a932dacd",
"assets/assets/content/blog/python/fastapi-vs-flask.mdx": "86221829446db575cb7d3f26905a77a0",
"assets/assets/content/blog/python/asyncio-tutorial.mdx": "f61dc38add9660c532dd0ae8c7d65e49",
"assets/assets/content/blog/python/decorator-generator.mdx": "fc247aaf0ec0716bc2cd9ddfa43810e5",
"assets/assets/content/blog/python/venv-management.mdx": "b8038f1b86c331a1afbd1c9afbee3878",
"assets/assets/content/blog/java/optional-guide.mdx": "4c6105a1d220ff443ff151dbd7e31c00",
"assets/assets/content/blog/java/jvm-memory.mdx": "ca673fbd7ebe1869387506a8182cd081",
"assets/assets/content/blog/java/spring-basics.mdx": "47d3a6133a5485b7dac28228763124f8",
"assets/assets/content/blog/java/java-multithreading.mdx": "51199193befd246fefa4211ef65c7dfd",
"assets/assets/content/blog/java/modern-java-features.mdx": "ace0dc74b5823421222d5631906f36a0",
"assets/assets/content/blog/ai-insight/ai-agent-trend.mdx": "da32c20f4a22f71d964445aafa41e458",
"assets/assets/content/blog/ai-insight/vector-db-guide.mdx": "35fc953f0479ee904ec5ce68aa3739b7",
"assets/assets/content/blog/ai-insight/local-llm-security.mdx": "c9f9040d60370a71c8a18a0372d1c724",
"assets/assets/content/blog/ai-insight/rag-strategy.mdx": "998c6f93e664891bff27279244135b52",
"assets/assets/content/blog/ai-insight/developer-future.mdx": "9bb875d2adbfbd58c63021b0c35b7956",
"assets/assets/content/blog/ai-basic/cursor-workflow.mdx": "73e910c588edf81f10798c47d1cfc618",
"assets/assets/content/blog/ai-basic/v0-prototyping.mdx": "b3b2d5da33aadb38b265665bbd43f470",
"assets/assets/content/blog/ai-basic/llm-api-integration.mdx": "f7339578647a3995138380d3e4f3d622",
"assets/assets/content/blog/ai-basic/ai-unit-testing.mdx": "79c6907cf6bf19c05935f13441322ef1",
"assets/assets/content/blog/ai-basic/ai-code-review.mdx": "a606e099ae5d99417d71069926f0d24c",
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
