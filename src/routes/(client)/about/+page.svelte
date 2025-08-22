<svelte:head>
  <title>About Us</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- About Us Header -->
<section class="relative bg-[url('/images/header7.jpg')] bg-cover bg-center bg-no-repeat py-32">
  <div class="absolute inset-0 bg-black/50"></div> <!-- overlay -->

  <div class="relative max-w-4xl mx-auto text-center px-6">
    <h1 class="text-4xl md:text-6xl font-bold text-white mb-6 animate-fadeIn">
      About Us
    </h1>
    
    <p class="max-w-3xl mx-auto text-gray-100 animate-fadeIn delay-200">
      At <span class="text-pink-200 font-semibold">Maid Search Singapore Pte Ltd</span>, we are committed to
      connecting families with trusted and well-trained domestic helpers. Guided by our values of care, respect, and professionalism,
      we ensure every match creates a safe and supportive environment for both employers and helpers.
    </p>
  </div>
</section>

<section class="bg-white py-16 px-6">
  <!-- Mission & Vision -->
  <div class="max-w-7xl mx-auto grid md:grid-cols-2 gap-8 mt-16">
    <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp">
      <h3 class="text-3xl font-bold text-pink-600 mb-4">Our Mission</h3>
      <p class="text-gray-700">
        To provide families with dependable, caring, and well-trained domestic helpers who enrich households with trust, compassion, and efficiency.
      </p>
    </div>
    <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp delay-100">
      <h3 class="text-3xl font-bold text-yellow-600 mb-4">Our Vision</h3>
      <p class="text-gray-700">
        To be Singapore’s most trusted maid agency, recognized for raising industry standards and creating lasting, positive relationships between families and helpers.
      </p>
    </div>
  </div>

  <!-- Core Values -->
  <div class="max-w-7xl mx-auto mt-20 text-center">
    <h2 class="text-4xl font-bold text-pink-600 mb-12 animate-fadeIn">Our Core Values</h2>
    <div class="grid md:grid-cols-3 gap-8">
      <!-- Care -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp">
        <div class="text-pink-600 text-5xl mb-4 animate-bounce">💖</div>
        <h3 class="text-2xl font-semibold text-pink-600 mb-2">Care</h3>
        <p class="text-gray-700">We put people first, ensuring both families and helpers feel supported and valued.</p>
      </div>
      <!-- Respect -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp delay-100">
        <div class="text-yellow-500 text-5xl mb-4 animate-bounce">🤝</div>
        <h3 class="text-2xl font-semibold text-yellow-600 mb-2">Respect</h3>
        <p class="text-gray-700">We foster mutual respect, ensuring fairness and dignity in every relationship we build.</p>
      </div>
      <!-- Professional -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp delay-200">
        <div class="text-pink-600 text-5xl mb-4 animate-bounce">📋</div>
        <h3 class="text-2xl font-semibold text-pink-600 mb-2">Professional</h3>
        <p class="text-gray-700">We uphold high standards of professionalism, ensuring reliable and transparent services.</p>
      </div>
    </div>
  </div>

  <!-- Google Map -->
  <div class="max-w-7xl mx-auto mt-20 text-center animate-fadeIn delay-200">
    <h2 class="text-4xl font-bold text-yellow-600 mb-6">Find Us</h2>
    <p class="text-gray-700 mb-6">Visit our headquarters in Singapore to learn more about how we can serve your family’s needs.</p>
    <div class="w-full h-[400px] rounded-2xl shadow-lg overflow-hidden">
      <!-- Replace with your HQ's actual map embed link -->
      <!-- svelte-ignore a11y_missing_attribute -->
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7402083446386!2d103.87653747573844!3d1.3319955986553826!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da19df4c5e7daf%3A0x4cceada1d07109da!2sMaid%20Search%20Singapore%20Pte%20Ltd!5e0!3m2!1sen!2smy!4v1755750188719!5m2!1sen!2smy"
        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
      </iframe>
    </div>
  </div>

  <div class="mt-8 text-center text-sm text-gray-500">
    <p>License No: L13C8379</p>
    <p>Company Registration No: 201303653G</p>
    <p>Employment Agency Registration No: R1327454</p>
</div>

</section>

<!-- Tailwind Animations -->
<style>
  @keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
  .animate-fadeIn { animation: fadeIn 1s ease forwards; }

  @keyframes slideUp { from {opacity:0; transform:translateY(20px);} to {opacity:1; transform:translateY(0);} }
  .animate-slideUp { animation: slideUp 0.8s ease forwards; }

  @keyframes bounce { 0%, 100% {transform: translateY(0);} 50% {transform: translateY(-8px);} }
  .animate-bounce { animation: bounce 2s infinite; }

  /* Delay helpers */
  .delay-100 { animation-delay: 0.1s; }
  .delay-200 { animation-delay: 0.2s; }
</style>
