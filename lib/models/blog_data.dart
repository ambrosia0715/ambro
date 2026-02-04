// 블로그 포스트 데이터 모델
class BlogPost {
  final String title;
  final String description;
  final String category;
  final String date;
  final String fileName;
  final String author;
  final String thumbnailUrl;
  final String readTime;
  final List<String> tags;
  final bool isLocalImage;

  const BlogPost({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.fileName,
    this.author = 'Ambro',
    this.thumbnailUrl = 'https://placehold.co/800x400/png?text=Tech+Blog',
    this.readTime = '5분',
    this.tags = const [],
    this.isLocalImage = false,
  });
}

// 블로그 데이터 저장소
class BlogData {
  static const Map<String, String> categories = {
    'java': 'Java',
    'python': 'Python',
    'ai-basic': 'AI 개발 기초',
    'ai-insight': 'AI Insight',
  };

  static const List<BlogPost> posts = [
    // Java
    BlogPost(
      title: 'JVM 메모리 구조 완벽 가이드',
      description:
          'Java 애플리케이션 성능 최적화를 위한 JVM 메모리 구조(Heap, Stack, Method Area) 심층 분석',
      category: 'java',
      date: '2026-02-04',
      fileName: 'jvm-memory.mdx',
      readTime: '12분',
      tags: ['Java', 'JVM', 'Performance'],
      thumbnailUrl: 'assets/images/blog/jvm_memory.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Modern Java: Java 8부터 21까지의 변화',
      description: '람다, 스트림부터 레코드, 가상 스레드까지. 모던 자바의 핵심 기능 총정리',
      category: 'java',
      date: '2026-02-04',
      fileName: 'modern-java-features.mdx',
      readTime: '15분',
      tags: ['Java', 'Modern Java', 'Virtual Threads'],
      thumbnailUrl: 'assets/images/blog/modern_java_evolution.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Java Optional 완벽 가이드',
      description: 'NullPointerException을 피하고 Optional을 올바르게 사용하는 방법',
      category: 'java',
      date: '2026-02-04',
      fileName: 'optional-guide.mdx',
      readTime: '8분',
      tags: ['Java', 'Optional', 'Best Practices'],
      thumbnailUrl: 'assets/images/blog/java_optional.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Spring Boot 기초: DI와 IoC 이해하기',
      description: '스프링 프레임워크의 핵심 철학인 제어의 역전(IoC)과 의존성 주입(DI) 개념 정리',
      category: 'java',
      date: '2026-02-04',
      fileName: 'spring-basics.mdx',
      readTime: '10분',
      tags: ['Spring Boot', 'DI', 'IoC'],
      thumbnailUrl: 'assets/images/blog/spring_boot_di.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Java 멀티스레딩과 동시성 프로그래밍',
      description: '스레드 생성부터 ExecutorService, 동기화까지 자바 동시성 프로그래밍의 기초',
      category: 'java',
      date: '2026-02-04',
      fileName: 'java-multithreading.mdx',
      readTime: '14분',
      tags: ['Java', 'Concurrency', 'Thread'],
      thumbnailUrl: 'assets/images/blog/java_multithreading.webp',
      isLocalImage: true,
    ),

    // Python
    BlogPost(
      title: '파이썬 가상환경 관리의 모든 것',
      description: 'venv, virtualenv, conda, poetry 비교 및 실무 가이드',
      category: 'python',
      date: '2026-02-04',
      fileName: 'venv-management.mdx',
      readTime: '10분',
      tags: ['Python', 'Virtual Env', 'Poetry'],
      thumbnailUrl: 'assets/images/blog/python_venv.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: '비동기 프로그래밍: asyncio 심층 분석',
      description: '파이썬의 동시성 프로그래밍을 위한 asyncio, await/async 완벽 이해',
      category: 'python',
      date: '2026-02-04',
      fileName: 'asyncio-tutorial.mdx',
      readTime: '12분',
      tags: ['Python', 'Asyncio', 'Concurrency'],
      thumbnailUrl: 'assets/images/blog/python_asyncio.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Pandas 데이터 분석 기초',
      description: '데이터프레임 조작부터 전처리까지 Pandas 핵심 기능 마스터하기',
      category: 'python',
      date: '2026-02-04',
      fileName: 'pandas-basics.mdx',
      readTime: '15분',
      tags: ['Python', 'Pandas', 'Data Analysis'],
      thumbnailUrl: 'assets/images/blog/pandas_analysis.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: '파이썬 중급 문법: 데코레이터와 제너레이터',
      description: '파이썬다운 코드를 작성하기 위한 데코레이터와 제너레이터 활용법',
      category: 'python',
      date: '2026-02-04',
      fileName: 'decorator-generator.mdx',
      readTime: '10분',
      tags: ['Python', 'Advanced'],
      thumbnailUrl: 'assets/images/blog/python_decorators.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'FastAPI vs Flask: 모던 웹 프레임워크 비교',
      description: '내 프로젝트에 맞는 파이썬 웹 프레임워크 선택 가이드',
      category: 'python',
      date: '2026-02-04',
      fileName: 'fastapi-vs-flask.mdx',
      readTime: '8분',
      tags: ['Python', 'FastAPI', 'Flask'],
      thumbnailUrl: 'assets/images/blog/fastapi_vs_flask.webp',
      isLocalImage: true,
    ),

    // AI Basic
    BlogPost(
      title: 'Cursor AI 에디터 200% 활용하기',
      description: 'AI 코딩 어시스턴트 Cursor의 워크플로우와 실무 활용 팁',
      category: 'ai-basic',
      date: '2026-02-04',
      fileName: 'cursor-workflow.mdx',
      readTime: '8분',
      tags: ['AI', 'Cursor', 'Productivity'],
      thumbnailUrl: 'assets/images/blog/cursor_ai.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'LLM API 연동 가이드',
      description: 'OpenAI, Anthropic API를 내 애플리케이션에 연동하는 방법',
      category: 'ai-basic',
      date: '2026-02-04',
      fileName: 'llm-api-integration.mdx',
      readTime: '10분',
      tags: ['AI', 'LLM', 'API'],
      thumbnailUrl: 'assets/images/blog/llm_api_integration.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'AI를 활용한 코드 리뷰 자동화',
      description: 'GitHub Actions와 LLM을 결합하여 자동 코드 리뷰 봇 만들기',
      category: 'ai-basic',
      date: '2026-02-04',
      fileName: 'ai-code-review.mdx',
      readTime: '12분',
      tags: ['AI', 'DevOps', 'GitHub Actions'],
      thumbnailUrl: 'assets/images/blog/ai_code_review.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'v0.dev로 웹사이트 프로토타이핑 가속화',
      description: '생성형 UI 도구 v0.dev를 사용하여 빠르게 프로토타입 만들기',
      category: 'ai-basic',
      date: '2026-02-04',
      fileName: 'v0-prototyping.mdx',
      readTime: '6분',
      tags: ['AI', 'UI/UX', 'v0.dev'],
      thumbnailUrl: 'assets/images/blog/v0_prototyping.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'AI와 함께하는 단위 테스트 작성',
      description: 'AI의 도움을 받아 효율적으로 테스트 케이스를 생성하고 커버리지 높이기',
      category: 'ai-basic',
      date: '2026-02-04',
      fileName: 'ai-unit-testing.mdx',
      readTime: '8분',
      tags: ['AI', 'Testing', 'Unit Test'],
      thumbnailUrl: 'assets/images/blog/ai_unit_testing.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: '바이브코딩(Vibe Coding)의 개념과 기초',
      description: '자연어로 설명하면 AI가 코드를 생성하는 바이브코딩의 핵심 개념과 시작하는 방법',
      category: 'ai-basic',
      date: '2026-02-05',
      fileName: 'vibe-coding.mdx',
      readTime: '9분',
      tags: ['AI', '바이브코딩', 'Vibe Coding', 'Cursor'],
      thumbnailUrl: 'assets/images/blog/vibe_coding.webp',
      isLocalImage: true,
    ),

    // AI Insight
    BlogPost(
      title: 'OpenClaw 최신 가이드: 개인용 AI 에이전트',
      description: '메신저에서 실질적인 업무를 수행하는 오픈소스 AI 에이전트 OpenClaw의 최신 정보와 활용법',
      category: 'ai-insight',
      date: '2026-02-05',
      fileName: 'openclaw-guide.mdx',
      readTime: '10분',
      tags: ['AI', 'OpenClaw', 'Agent', '오픈소스'],
      thumbnailUrl: 'assets/images/blog/openclaw_ai.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'RAG(검색 증강 생성) 전략 가이드',
      description: 'LLM의 환각 현상을 줄이고 최신 정보를 반영하는 RAG 시스템 구축 전략',
      category: 'ai-insight',
      date: '2026-02-04',
      fileName: 'rag-strategy.mdx',
      readTime: '15분',
      tags: ['AI', 'RAG', 'LLM'],
      thumbnailUrl: 'assets/images/blog/rag_architecture.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'Vector DB 비교 및 선택 가이드',
      description: 'Pinecone, Weaviate, Milvus, Chroma 등 주요 벡터 DB 특징 비교',
      category: 'ai-insight',
      date: '2026-02-04',
      fileName: 'vector-db-guide.mdx',
      readTime: '12분',
      tags: ['AI', 'Vector DB', 'Database'],
      thumbnailUrl: 'assets/images/blog/vector_db_guide.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'AI Agent 트렌드와 미래',
      description: '자율적으로 행동하는 AI 에이전트의 현재 기술 수준과 활용 사례',
      category: 'ai-insight',
      date: '2026-02-04',
      fileName: 'ai-agent-trend.mdx',
      readTime: '10분',
      tags: ['AI', 'Agent', 'Trend'],
      thumbnailUrl: 'assets/images/blog/ai_agents_trend.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: '로컬 LLM과 보안',
      description: 'Ollama 등을 활용하여 로컬 환경에서 LLM을 구동하고 데이터를 보호하는 방법',
      category: 'ai-insight',
      date: '2026-02-04',
      fileName: 'local-llm-security.mdx',
      readTime: '10분',
      tags: ['AI', 'Local LLM', 'Security'],
      thumbnailUrl: 'assets/images/blog/local_llm_security.webp',
      isLocalImage: true,
    ),
    BlogPost(
      title: 'AI 시대, 개발자의 미래',
      description: 'AI가 코딩하는 시대, 개발자는 어떤 역량을 키워야 살아남을 수 있을까?',
      category: 'ai-insight',
      date: '2026-02-04',
      fileName: 'developer-future.mdx',
      readTime: '8분',
      tags: ['Insight', 'Career', 'Future'],
      thumbnailUrl: 'assets/images/blog/developer_future.webp',
      isLocalImage: true,
    ),
  ];

  static List<BlogPost> getPostsByCategory(String categoryId) {
    final list = posts.where((post) => post.category == categoryId).toList();
    list.sort((a, b) => b.date.compareTo(a.date)); // 최신순
    return list;
  }
}
