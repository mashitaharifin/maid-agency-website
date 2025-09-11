<script lang="ts">
  let { data } = $props();
// Lightweight scroll-reveal action (no extra libraries)
  function reveal(node: HTMLElement, opts = { threshold: 0.15, delay: 0 }) {
    const { threshold, delay } = opts;
    const onIntersect = (entries: IntersectionObserverEntry[], observer: IntersectionObserver) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setTimeout(() => {
            node.classList.remove('opacity-0', 'translate-y-6');
            node.classList.add('opacity-100', 'translate-y-0');
          }, delay);
          observer.unobserve(node);
        }
      });
    };

  const io = new IntersectionObserver(onIntersect, { threshold });
  // start hidden
  node.classList.add('opacity-0', 'translate-y-6', 'transition', 'duration-700', 'ease-out');
  io.observe(node);

  return {
    destroy() {
      io.disconnect();
    }
  };
}

// Simple accordion state for FAQ
let openFaq: number | null = 0;
const toggleFaq = (i: number) => (openFaq = openFaq === i ? null : i);

import { onMount } from "svelte";

  let modalOpen = $state(false);
  let modalSrc = $state("");

  function openModal(src: string) {
    modalSrc = src;
    modalOpen = true;
  }

  function closeModal() {
    modalOpen = false;
    modalSrc = "";
  }
</script>

<svelte:head>
  <title>Maids</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- Maids Header -->
<section class="relative bg-cover bg-center bg-no-repeat py-32"
  style="background-image: url('{data.hero?.bgImage}')">
  <!-- Overlay -->
  <div class="absolute inset-0 bg-black/30"></div>
  <!-- Content -->
  <div use:reveal={{ delay: 0 }} class="relative max-w-4xl mx-auto text-center px-6 opacity-0 translate-y-6">
    <h1 class="text-4xl md:text-6xl font-bold text-white mb-6">
      {data.hero?.mainHeading}
    </h1>
    <p class="text-gray-100 md:text-base leading-relaxed">
      {data.hero?.subheading}
    </p>
  </div>
</section>


<!-- Why Work in Singapore -->
<section id="why-singapore" class="max-w-6xl mx-auto px-6 py-14">
  <div class="grid md:grid-cols-2 gap-10 items-start">
    <div use:reveal class="opacity-0 translate-y-6">
      <h2 class="text-2xl md:text-3xl font-bold text-pink-500">{data.reasons[0].category}</h2>
      <p class="mt-3 text-gray-600">
        {data.reasons[0].category_desc}
      </p>
      <ul class="mt-6 space-y-4">
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-emerald-100 items-center justify-center">{data.reasons[0].icon}</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[0].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[0].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-blue-100 items-center justify-center">{data.reasons[1].icon}</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[1].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[1].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-amber-100 items-center justify-center">{data.reasons[2].icon}</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[2].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[2].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-pink-100 items-center justify-center">🌏</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[3].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[3].description}</p>
          </div>
        </li>
      </ul>
    </div>

    <!-- Why Work With Us -->
    <div use:reveal={{ delay: 120 }} class="opacity-0 translate-y-6">
      <h2 class="text-2xl md:text-3xl font-bold text-pink-500">{data.reasons[4].category}</h2>
      <p class="mt-3 text-gray-600">{data.reasons[4].category_desc}</p>
      <ul class="mt-6 space-y-4">
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-indigo-100 items-center justify-center">✅</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[4].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[4].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-rose-100 items-center justify-center">🤝</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[5].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[5].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-teal-100 items-center justify-center">🎓</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[6].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[6].description}</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-fuchsia-100 items-center justify-center">🛡️</span>
          <div>
            <p class="font-semibold text-gray-800">{data.reasons[7].title}</p>
            <p class="text-gray-600 text-sm">{data.reasons[7].description}</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
</section>

<!-- 📌 Gallery Section -->
<section class="max-w-6xl mx-auto px-6 py-16">
  <h2 class="text-2xl md:text-3xl font-bold text-pink-500 text-center mb-8">
    {data.galleries[0].title}
  </h2>

  <p class="text-gray-600 text-center max-w-3xl mx-auto mb-10">
    {data.galleries[0].description} 
    <span class="font-semibold text-pink-300">{data.galleries[1].description} </span>. {data.galleries[2].description} 
  </p>
  
  <!-- Masonry Grid -->
  <div class="columns-2 md:columns-3 gap-4 space-y-4">
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[0].imageUrl} alt={data.galleryImages[0].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[0].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[1].imageUrl} alt={data.galleryImages[1].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[1].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[2].imageUrl} alt={data.galleryImages[2].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[2].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[3].imageUrl} alt={data.galleryImages[3].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[3].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[4].imageUrl} alt={data.galleryImages[4].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[4].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[5].imageUrl} alt={data.galleryImages[5].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[5].imageUrl)}>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
    <!-- svelte-ignore event_directive_deprecated -->
    <img src={data.galleryImages[6].imageUrl} alt={data.galleryImages[6].alt}
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal(data.galleryImages[6].imageUrl)}>
  </div>
</section>

<!-- Modal -->
{#if modalOpen}
<div class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-[9999]">
  <!-- Close Button -->
  <!-- svelte-ignore event_directive_deprecated -->
  <button on:click={closeModal} class="absolute top-5 right-5 text-white text-3xl font-bold">
    ✕
  </button>

  <!-- Modal Content -->
  <!-- svelte-ignore a11y_img_redundant_alt -->
  <img src={modalSrc} alt="Expanded Image"
       class="max-w-[90%] max-h-[80%] rounded-lg shadow-lg border-4 border-white">
</div>
{/if}


<!-- Nationality Cards -->
<section class="max-w-6xl mx-auto px-6 py-10">
  <div class="grid md:grid-cols-2 gap-8">
    <!-- Myanmarese -->
    <article use:reveal class="opacity-0 translate-y-6 p-7 rounded-2xl border border-pink-300 bg-white shadow-sm hover:shadow-xl transition hover:-translate-y-1">
      <div class="flex items-center gap-3">
        <span class="text-2xl">{data.nationalities[0].flag}</span>
        <h3 class="text-xl font-semibold text-pink-500">{data.nationalities[0].title}</h3>
      </div>
      <p class="mt-3 text-gray-600">
        {data.nationalities[0].description}
      </p>
      <ul class="mt-4 text-sm text-gray-700 space-y-2">
        <li>• {data.nationalityPoints[0].point}</li>
        <li>• {data.nationalityPoints[1].point}</li>
        <li>• {data.nationalityPoints[2].point}</li>
      </ul>
    </article>

    <!-- Indonesian -->
    <article use:reveal={{ delay: 120 }} class="opacity-0 translate-y-6 p-7 rounded-2xl border  border-pink-300 bg-white shadow-sm hover:shadow-xl transition hover:-translate-y-1">
      <div class="flex items-center gap-3">
        <span class="text-2xl">{data.nationalities[1].flag}</span>
        <h3 class="text-xl font-semibold text-pink-500">{data.nationalities[1].title}</h3>
      </div>
      <p class="mt-3 text-gray-600">
        {data.nationalities[1].description}
      </p>
      <ul class="mt-4 text-sm text-gray-700 space-y-2">
        <li>• {data.nationalityPoints[3].point}</li>
        <li>• {data.nationalityPoints[4].point}</li>
        <li>• {data.nationalityPoints[5].point}</li>
      </ul>
    </article>
  </div>
</section>

<!-- Steps to Apply -->
<section class="max-w-6xl mx-auto px-6 py-10">
  <div class="rounded-3xl bg-gradient-to-r from-pink-50 to-yellow-50 border border-pink-100 p-8">
    
    <h2 class="text-2xl text-center font-bold text-pink-500">{data.steps[0].sectiontitle}</h2>
    <ol class="mt-4 grid md:grid-cols-4 gap-6">
      <li use:reveal class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">{data.steps[0].stepNumber}</p>
          <p class="font-semibold text-gray-800 mt-1">{data.steps[0].title}</p>
          <p class="text-sm text-gray-600 mt-2">{data.steps[0].description}</p>
        </div>
      </li>
      <li use:reveal={{ delay: 80 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">{data.steps[1].stepNumber}</p>
          <p class="font-semibold text-gray-800 mt-1">{data.steps[1].title}</p>
          <p class="text-sm text-gray-600 mt-2">{data.steps[1].description}</p>
        </div>
      </li>
      <li use:reveal={{ delay: 160 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">{data.steps[2].stepNumber}</p>
          <p class="font-semibold text-gray-800 mt-1">{data.steps[2].title}</p>
          <p class="text-sm text-gray-600 mt-2">{data.steps[2].description}</p>
        </div>
      </li>
      <li use:reveal={{ delay: 240 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">{data.steps[3].stepNumber}</p>
          <p class="font-semibold text-gray-800 mt-1">{data.steps[3].title}</p>
          <p class="text-sm text-gray-600 mt-2">{data.steps[3].description}</p>
        </div>
      </li>
    </ol>
    <div class="mt-8 flex flex-wrap items-center gap-4">
        <a
          href="https://wa.me/6596825955"
          target="_blank"
          rel="noopener"
          class="inline-flex items-center gap-2 rounded-3xl px-6 py-3 text-white bg-pink-300 
          hover:bg-gradient-to-r hover:from-[#f5b9dd] hover:to-[#e9cc6f] 
          shadow-lg shadow-pink-300 active:scale-[0.98] transition mx-auto"
          aria-label="Join us on WhatsApp"
        >
          <!-- WhatsApp icon -->
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="currentColor">
            <path d="M.057 24l1.687-6.163A11.867 11.867 0 0111.94 0C18.6 0 24 5.373 24 12.01 24 18.647 18.6 24 11.94 24a11.9 11.9 0 01-6.1-1.69L.057 24zM6.6 20.13c1.81 1.08 3.95 1.64 6.13 1.64 6.23 0 11.29-5.05 11.29-11.26 0-6.21-5.06-11.26-11.29-11.26-6.22 0-11.29 5.05-11.29 11.26 0 2.04.55 4.02 1.6 5.76l-.98 3.58 3.54-.92z"/>
            <path d="M17.5 14.37c-.1-.16-.36-.26-.76-.45-.41-.18-2.4-1.18-2.77-1.32-.37-.14-.64-.21-.9.21-.26.42-1.03 1.32-1.26 1.59-.23.26-.46.3-.86.11-.4-.2-1.68-.62-3.2-1.98-1.18-1.05-1.97-2.35-2.2-2.75-.23-.41-.02-.63.17-.85.18-.22.41-.57.62-.86.2-.3.27-.51.4-.85.13-.34.07-.64-.03-.9-.11-.26-.9-2.18-1.23-2.98-.33-.79-.67-.68-.9-.69l-.77-.01c-.26 0-.68.1-1.03.5-.35.39-1.35 1.32-1.35 3.2 0 1.88 1.39 3.7 1.58 3.96.2.26 2.74 4.19 6.62 5.87.93.4 1.66.64 2.23.82.93.29 1.77.25 2.44.15.74-.11 2.4-.98 2.74-1.93.34-.95.34-1.77.24-1.93z"/>
          </svg>
          Let's talk with us!
        </a>
      </div>
  </div>
</section>

<!-- FAQ -->
<section class="max-w-3xl mx-auto px-6 py-12">
  <h2 class="text-2xl md:text-3xl font-bold text-yellow-600 text-center">{data.faqs[0].sectiontitle}</h2>
  
  <div class="mt-6 divide-y divide-gray-200 border border-gray-200 rounded-2xl overflow-hidden">
    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        {data.faqs[0].question}
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        {data.faqs[0].answer}
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        {data.faqs[1].question}
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        {data.faqs[1].answer}
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        {data.faqs[2].question}
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        {data.faqs[2].answer}
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        {data.faqs[3].question}
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        {data.faqs[3].answer}
      </p>
    </details>
  </div>
</section>



