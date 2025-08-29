<script>
    let { data } = $props();
    const steps = data.helperSteps;
</script>

<svelte:head>
  <title>Find Your Helper</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- Find Your Helper Header -->
<section class="relative bg-cover bg-center bg-no-repeat py-32"
  style="background-image: url({data.hero.bgImage});">
  <div class="absolute inset-0 bg-black/50"></div> <!-- overlay -->

  <div class="relative max-w-4xl mx-auto text-center px-6">
    <h1 class="text-4xl md:text-6xl font-bold text-white mb-6 animate-fadeIn">
      {data.hero.mainHeading}
    </h1>
    <p class="max-w-2xl mx-auto text-gray-100 animate-fadeIn delay-100">
      {data.hero.subheading}
    </p>   
  </div>
</section>

<section class="bg-white py-16 px-6">
  <!-- Steps -->
  <div class="max-w-7xl mx-auto mt-16">
    <h2 class="text-3xl md:text-4xl font-bold text-pink-500 text-center mb-10 animate-fadeIn">{data.steps[0]?.sectionTitle}</h2>
    <div class="grid md:grid-cols-5 gap-6">
  <!-- Step 1 -->
  <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
              hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp">
    <div class="flex items-center justify-center w-16 h-16 bg-pink-300 rounded-full mx-auto mb-4 
                hover:rotate-12 transition duration-300">
      <span class="text-white text-2xl">{data.steps[0].icon}</span>
    </div>
    <p class="text-xs font-semibold text-pink-600 mb-1 text-center">{data.steps[0].stepNo}</p>
    <h3 class="text-lg font-semibold text-pink-600 text-center mb-2">{data.steps[0].title}</h3>
    <p class="text-gray-700 text-sm text-center">{data.steps[0].description}</p>
  </div>

  <!-- Step 2 -->
  <div class="bg-yellow-50 border-t-4 border-yellow-500 rounded-2xl shadow-lg p-6 
              hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-100">
    <div class="flex items-center justify-center w-16 h-16 bg-yellow-500 rounded-full mx-auto mb-4 
                hover:rotate-12 transition duration-300">
      <span class="text-white text-2xl">{data.steps[1].icon}</span>
    </div>
    <p class="text-xs font-semibold text-yellow-600 mb-1 text-center">{data.steps[1].stepNo}</p>
    <h3 class="text-lg font-semibold text-yellow-600 text-center mb-2">{data.steps[1].title}</h3>
    <p class="text-gray-700 text-sm text-center">{data.steps[1].description}</p>
  </div>

  <!-- Step 3 -->
  <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
              hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-200">
    <div class="flex items-center justify-center w-16 h-16 bg-pink-300 rounded-full mx-auto mb-4 
                hover:rotate-12 transition duration-300">
      <span class="text-white text-2xl">{data.steps[2].icon}</span>
    </div>
    <p class="text-xs font-semibold text-pink-600 mb-1 text-center">{data.steps[2].stepNo}</p>
    <h3 class="text-lg font-semibold text-pink-600 text-center mb-2">{data.steps[2].title}</h3>
    <p class="text-gray-700 text-sm text-center">{data.steps[2].description}</p>
  </div>

  <!-- Step 4 -->
  <div class="bg-yellow-50 border-t-4 border-yellow-500 rounded-2xl shadow-lg p-6 
              hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-300">
    <div class="flex items-center justify-center w-16 h-16 bg-yellow-500 rounded-full mx-auto mb-4 
                hover:rotate-12 transition duration-300">
      <span class="text-white text-2xl">{data.steps[3].icon}</span>
    </div>
    <p class="text-xs font-semibold text-yellow-600 mb-1 text-center">{data.steps[3].stepNo}</p>
    <h3 class="text-lg font-semibold text-yellow-600 text-center mb-2">{data.steps[3].title}</h3>
    <p class="text-gray-700 text-sm text-center">{data.steps[3].description}</p>
  </div>

  <!-- Step 5 -->
  <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
              hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-400">
    <div class="flex items-center justify-center w-16 h-16 bg-pink-300 rounded-full mx-auto mb-4 
                hover:rotate-12 transition duration-300">
      <span class="text-white text-2xl">{data.steps[4].icon}</span>
    </div>
    <p class="text-xs font-semibold text-pink-600 mb-1 text-center">{data.steps[4].stepNo}</p>
    <h3 class="text-lg font-semibold text-pink-600 text-center mb-2">{data.steps[4].title}</h3>
    <p class="text-gray-700 text-sm text-center">{data.steps[4].description}</p>
  </div>
</div>

  <!-- Why Choose Us -->
  <div class="max-w-7xl mx-auto mt-20 px-6">
    <h2 class="text-3xl md:text-4xl font-bold text-yellow-600 text-center mb-12 animate-fadeIn">
        {data.choose[0]?.sectionTitle}
    </h2>

    <div class="space-y-10">
        <!-- Feature 1 -->
        <div class="flex items-start gap-6 animate-slideUp">
        <div class="flex-shrink-0 w-16 h-16 rounded-full bg-pink-600 flex items-center justify-center text-white text-3xl shadow-lg transform transition duration-300 hover:scale-110 hover:shadow-[0_0_25px_6px_rgba(245,185,221,0.6)]">
            {data.choose[0]?.icon}
        </div>
        <div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">{data.choose[0]?.reason}</h3>
            <p class="text-gray-700">{data.choose[0]?.description}</p>
        </div>
        </div>

        <!-- Feature 2 -->
        <div class="flex items-start gap-6 animate-slideUp delay-100">
        <div class="flex-shrink-0 w-16 h-16 rounded-full bg-yellow-500 flex items-center justify-center text-white text-3xl shadow-lg transform transition duration-300 hover:scale-110 hover:shadow-[0_0_25px_6px_rgba(245,185,221,0.6)]">
            {data.choose[1]?.icon}
        </div>
        <div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">{data.choose[1]?.reason}</h3>
            <p class="text-gray-700">{data.choose[1]?.description}</p>
        </div>
        </div>

        <!-- Feature 3 -->
        <div class="flex items-start gap-6 animate-slideUp delay-200">
        <div class="flex-shrink-0 w-16 h-16 rounded-full bg-pink-600 flex items-center justify-center text-white text-3xl shadow-lg transform transition duration-300 hover:scale-110 hover:shadow-[0_0_25px_6px_rgba(245,185,221,0.6)]">
            {data.choose[2]?.icon}
        </div>
        <div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">{data.choose[2]?.reason}</h3>
            <p class="text-gray-700">{data.choose[2]?.description}</p>
        </div>
        </div>
    </div>

  </div>
</div>


  <!-- FAQ -->
  <div class="max-w-5xl mx-auto mt-16">
    <h3 class="text-3xl font-bold text-pink-500 text-center mb-6">{data.faqs[0]?.sectionTitle}</h3>
    <div class="divide-y divide-gray-200 border border-gray-200 rounded-2xl overflow-hidden">
      <details class="p-5 group">
        <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
          {data.faqs[0]?.question}
          <span class="text-pink-600 transition group-open:rotate-90">▶</span>
        </summary>
        <p class="mt-3 text-gray-700">{data.faqs[0]?.answer}</p>
      </details>
      <details class="p-5 group">
        <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
          {data.faqs[1]?.question}
          <span class="text-pink-600 transition group-open:rotate-90">▶</span>
        </summary>
        <p class="mt-3 text-gray-700">{data.faqs[1]?.answer}</p>
      </details>
      <details class="p-5 group">
        <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
          {data.faqs[2]?.question}
          <span class="text-pink-600 transition group-open:rotate-90">▶</span>
        </summary>
        <p class="mt-3 text-gray-700">{data.faqs[2]?.answer}</p>
      </details>
    </div>
  </div>

  <!-- CTA Banner -->
  <div class="max-w-7xl mx-auto mt-20">
    <div class="rounded-3xl p-10 text-center bg-gradient-to-r from-pink-50 to-yellow-50 border border-pink-100">
      <h3 class="text-2xl md:text-3xl font-bold text-pink-300 mb-3">Ready to find a helper you can trust?</h3>
      <p class="text-gray-700 mb-6">Start with a quick consultation or browse profiles right away.</p>
      <div class="flex items-center justify-center gap-4">
        <a href="https://wa.me/6596825955" target="_blank" rel="noopener" class="inline-flex items-center gap-2 rounded-full px-6 py-3 text-pink-600 border border-pink-600 hover:border-yellow-600 hover:text-yellow-600 transition">
          Talk to Us
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Animations -->
<style>
  @keyframes fadeIn { from {opacity:0} to {opacity:1} }
  .animate-fadeIn { animation: fadeIn 0.9s ease forwards }
  @keyframes slideUp { from {opacity:0; transform: translateY(16px)} to {opacity:1; transform: translateY(0)} }
  .animate-slideUp { animation: slideUp 0.7s ease forwards }
  @keyframes bounce { 0%,100% {transform: translateY(0)} 50% {transform: translateY(-8px)} }
  .animate-bounce { animation: bounce 2s infinite }
  .delay-50 { animation-delay: .05s } .delay-100 { animation-delay: .1s } .delay-150 { animation-delay: .15s } .delay-200 { animation-delay: .2s }
</style>
