<script lang="ts">
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

  let modalOpen = false;
  let modalSrc = "";

  function openModal(src) {
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
<section class="relative bg-[url('/images/header3.jpg')] bg-cover bg-center bg-no-repeat py-32">
  <!-- Overlay -->
  <div class="absolute inset-0 bg-black/30"></div>
  <!-- Content -->
  <div use:reveal={{ delay: 0 }} class="relative max-w-4xl mx-auto text-center px-6 opacity-0 translate-y-6">
    <h1 class="text-4xl md:text-6xl font-bold text-white mb-6">
      Maids
    </h1>
    <p class="text-gray-100 md:text-lg leading-relaxed">
      Searching for a friendly family to work for? Singapore provides a great opportunity with
      supportive employers and a culture you can feel at home with.
    </p>
  </div>
</section>


<!-- Why Work in Singapore -->
<section id="why-singapore" class="max-w-6xl mx-auto px-6 py-14">
  <div class="grid md:grid-cols-2 gap-10 items-start">
    <div use:reveal class="opacity-0 translate-y-6">
      <h2 class="text-2xl md:text-3xl font-bold text-pink-500">Why Work in Singapore?</h2>
      <p class="mt-3 text-gray-600">
        Helpers in Singapore benefit from reliable employers, strong protections, and a multicultural community.
      </p>
      <ul class="mt-6 space-y-4">
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-emerald-100 items-center justify-center">💰</span>
          <div>
            <p class="font-semibold text-gray-800">Competitive Salary</p>
            <p class="text-gray-600 text-sm">Earn more than typical local opportunities.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-blue-100 items-center justify-center">🏡</span>
          <div>
            <p class="font-semibold text-gray-800">Safe & Supportive</p>
            <p class="text-gray-600 text-sm">Live with caring families in a safe city.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-amber-100 items-center justify-center">📚</span>
          <div>
            <p class="font-semibold text-gray-800">Learn New Skills</p>
            <p class="text-gray-600 text-sm">Childcare, eldercare, cooking, and more.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-pink-100 items-center justify-center">🌏</span>
          <div>
            <p class="font-semibold text-gray-800">Welcoming Community</p>
            <p class="text-gray-600 text-sm">Meet friends from many cultures.</p>
          </div>
        </li>
      </ul>
    </div>

    <!-- Why Work With Us -->
    <div use:reveal={{ delay: 120 }} class="opacity-0 translate-y-6">
      <h2 class="text-2xl md:text-3xl font-bold text-pink-500">Why Work With Us?</h2>
      <p class="mt-3 text-gray-600">A trusted agency that supports you before and after placement.</p>
      <ul class="mt-6 space-y-4">
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-indigo-100 items-center justify-center">✅</span>
          <div>
            <p class="font-semibold text-gray-800">Trusted Placements</p>
            <p class="text-gray-600 text-sm">Proven track record with caring employers.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-rose-100 items-center justify-center">🤝</span>
          <div>
            <p class="font-semibold text-gray-800">Fair & Respectful</p>
            <p class="text-gray-600 text-sm">We advocate for your rights and wellbeing.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-teal-100 items-center justify-center">🎓</span>
          <div>
            <p class="font-semibold text-gray-800">Pre-Employment Training</p>
            <p class="text-gray-600 text-sm">Get prepared for success before your first day.</p>
          </div>
        </li>
        <li class="flex items-start gap-3">
          <span class="mt-1 inline-flex h-7 w-7 rounded-full bg-fuchsia-100 items-center justify-center">🛡️</span>
          <div>
            <p class="font-semibold text-gray-800">Documents & Insurance</p>
            <p class="text-gray-600 text-sm">We handle the paperwork so you don’t have to.</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
</section>

<!-- Hero Illustration -->
<section class= "py-20">
    <div class="max-w-4xl mx-auto px-6">
    <div use:reveal={{ delay: 120 }} class="opacity-0 translate-y-6">
      <div class="relative">
        <div class="absolute -inset-6 rounded-3xl bg-gradient-to-tr from-pink-200 to-amber-200 blur-2xl opacity-60"></div>
        <div class="relative bg-white rounded-3xl border shadow-xl p-6 md:p-8">
          <div class="grid grid-cols-3 gap-4">
            <div class="col-span-2 space-y-4">
              <div class="h-24 rounded-xl bg-pink-50 border flex items-center justify-center">
                <span class="text-sm text-pink-700 font-medium">Friendly Families</span>
              </div>
              <div class="h-24 rounded-xl bg-amber-50 border flex items-center justify-center">
                <span class="text-sm text-amber-700 font-medium">Safe Environment</span>
              </div>
            </div>
            <div class="space-y-4">
              <div class="h-24 rounded-xl bg-emerald-50 border flex items-center justify-center">
                <span class="text-sm text-emerald-700 font-medium">Skill Growth</span>
              </div>
              <div class="h-24 rounded-xl bg-pink-100 border flex items-center justify-center">
                <span class="text-sm text-pink-700 font-medium">Good Salary</span>
              </div>
            </div>
          </div>
          <p class="mt-6 text-sm text-gray-500 text-center">Opportunities to thrive in Singapore</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 📌 Gallery Section -->
<section class="max-w-6xl mx-auto px-6 py-16">
  <h2 class="text-2xl md:text-3xl font-bold text-pink-500 text-center mb-8">
    Gallery Highlights
  </h2>

  <p class="text-gray-600 text-center max-w-3xl mx-auto mb-10">
    Discover moments that reflect our dedication and values. From training sessions and family 
    matches to agency events, our gallery showcases the people and stories behind 
    <span class="font-semibold text-pink-300">Maid Search Singapore Pte Ltd</span>. Each highlight 
    captures our commitment to professionalism, care, and building trusted relationships between 
    families and helpers.
  </p>
  
  <!-- Masonry Grid -->
  <div class="columns-2 md:columns-3 gap-4 space-y-4">
    <img src="/images/gallery1.jpg" alt="Gallery 1"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery1.jpg')}>
    <img src="/images/gallery2.jpg" alt="Gallery 2"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery2.jpg')}>
    <img src="/images/gallery3.jpg" alt="Gallery 3"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery3.jpg')}>
    <img src="/images/gallery4.jpg" alt="Gallery 4"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery4.jpg')}>
    <img src="/images/gallery5.jpg" alt="Gallery 5"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery5.jpg')}>
    <img src="/images/gallery6.jpg" alt="Gallery 6"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery6.jpg')}>
    <img src="/images/gallery7.jpg" alt="Gallery 7"
         class="w-full rounded-xl shadow-md cursor-pointer hover:opacity-80 transition"
         on:click={() => openModal('/images/gallery7.jpg')}>
  </div>
</section>

<!-- Modal -->
{#if modalOpen}
<div class="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50">
  <!-- Close Button -->
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
        <span class="text-2xl">🇲🇲</span>
        <h3 class="text-xl font-semibold text-pink-500">Myanmarese Maids</h3>
      </div>
      <p class="mt-3 text-gray-600">
        Known for adaptability and dedication. Many are quick learners and adjust well to Singaporean households.
      </p>
      <ul class="mt-4 text-sm text-gray-700 space-y-2">
        <li>• Strong work ethic and patience</li>
        <li>• Willing to learn languages and routines</li>
        <li>• Suitable for childcare and general housework</li>
      </ul>
    </article>

    <!-- Indonesian -->
    <article use:reveal={{ delay: 120 }} class="opacity-0 translate-y-6 p-7 rounded-2xl border  border-pink-300 bg-white shadow-sm hover:shadow-xl transition hover:-translate-y-1">
      <div class="flex items-center gap-3">
        <span class="text-2xl">🇮🇩</span>
        <h3 class="text-xl font-semibold text-pink-500">Indonesian Maids</h3>
      </div>
      <p class="mt-3 text-gray-600">
        Experienced, caring, and often able to communicate in Malay. Trusted for childcare and elderly support.
      </p>
      <ul class="mt-4 text-sm text-gray-700 space-y-2">
        <li>• Warm personality and reliability</li>
        <li>• Familiar with Southeast Asian cuisine</li>
        <li>• Strong experience in caregiving</li>
      </ul>
    </article>
  </div>
</section>

<!-- Steps to Apply -->
<section class="max-w-6xl mx-auto px-6 py-10">
  <div class="rounded-3xl bg-gradient-to-r from-pink-50 to-yellow-50 border border-pink-100 p-8">
    
    <h2 class="text-2xl text-center font-bold text-pink-500">How to Apply</h2>
    <ol class="mt-4 grid md:grid-cols-4 gap-6">
      <li use:reveal class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">Step 1</p>
          <p class="font-semibold text-gray-800 mt-1">Say Hello on WhatsApp</p>
          <p class="text-sm text-gray-600 mt-2">Message us at <span class="font-medium">+65 9682 5955</span>.</p>
        </div>
      </li>
      <li use:reveal={{ delay: 80 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">Step 2</p>
          <p class="font-semibold text-gray-800 mt-1">Short Interview</p>
          <p class="text-sm text-gray-600 mt-2">We understand your skills and preferences.</p>
        </div>
      </li>
      <li use:reveal={{ delay: 160 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">Step 3</p>
          <p class="font-semibold text-gray-800 mt-1">Training & Documents</p>
          <p class="text-sm text-gray-600 mt-2">We guide you through every requirement.</p>
        </div>
      </li>
      <li use:reveal={{ delay: 240 }} class="opacity-0 translate-y-6">
        <div class="h-full rounded-2xl bg-white border p-5">
          <p class="text-sm text-gray-500">Step 4</p>
          <p class="font-semibold text-gray-800 mt-1">Placement</p>
          <p class="text-sm text-gray-600 mt-2">Join a respectful family in Singapore.</p>
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
  <h2 class="text-2xl md:text-3xl font-bold text-yellow-600 text-center">Frequently Asked Questions</h2>
  
  <div class="mt-6 divide-y divide-gray-200 border border-gray-200 rounded-2xl overflow-hidden">
    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        Who can apply?
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        Myanmarese and Indonesian helpers aged 23–50 with a valid passport and good health are welcome. 
        If you are outside this range, contact us and we will advise.
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        Do you provide training?
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        Yes. We offer pre-employment training focusing on safety, hygiene, childcare/eldercare, and basic household management.
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        Is accommodation provided?
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        Live-in arrangements are standard in Singapore. Families provide accommodation and meals as part of employment.
      </p>
    </details>

    <details class="p-5 group">
      <summary class="cursor-pointer font-semibold text-gray-900 flex items-center justify-between">
        What support do I get after placement?
        <span class="text-pink-600 transition group-open:rotate-90">▶</span>
      </summary>
      <p class="mt-3 text-gray-700">
        We stay in touch to ensure you are treated fairly and help with any documentation or mediation if needed.
      </p>
    </details>
  </div>
</section>



