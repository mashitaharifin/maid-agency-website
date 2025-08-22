<svelte:head>
  <title>Pre-Employment Training</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<section class="relative bg-[url('/images/header4.jpg')] bg-cover bg-center bg-no-repeat py-32">
  <!-- Dark overlay -->
  <div class="absolute inset-0 bg-black/50"></div>

  <!-- Header Content -->
  <div class="relative max-w-4xl mx-auto text-center px-4">
    <h1 class="text-4xl md:text-5xl font-bold text-white drop-shadow-lg animate-fadeIn">
      Pre-Employment Training
    </h1>
    <p class="mt-4 mb-12 text-gray-100 animate-fadeIn delay-200">
      At Maid Search Singapore, we believe proper training builds confidence, skills, and trust. 
      Our Pre-Employment Training programs prepare helpers with essential knowledge in 
      <span class="text-yellow-300 font-semibold">infant care</span>, 
      <span class="text-yellow-300 font-semibold">elderly care</span>, and 
      <span class="text-yellow-300 font-semibold">housekeeping</span>—ensuring they’re ready 
      to provide safe, reliable, and professional support for your home.
    </p>
  </div>
</section>

<section class="bg-gray-50 py-16">
  <!-- Subsections -->
  <div class="mt-12 max-w-6xl mx-auto grid gap-10 md:grid-cols-3 px-6">
    <!-- Infant Care -->
    <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp">
      <div class="flex items-center justify-center w-16 h-16 bg-pink-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">👶</span>
      </div>
      <h2 class="text-xl font-bold text-pink-600 text-center mb-3">Infant Care</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>✔ Gentle handling & bathing of babies</li>
        <li>✔ Preparing & sterilizing milk bottles</li>
        <li>✔ Safe feeding practices & hygiene</li>
        <li>✔ Recognizing signs of discomfort</li>
        <li>✔ Emotional bonding & comfort</li>
      </ul>
    </div>

    <!-- Elderly Care -->
    <div class="bg-yellow-50 border-t-4 border-yellow-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-200">
      <div class="flex items-center justify-center w-16 h-16 bg-yellow-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">👵</span>
      </div>
      <h2 class="text-xl font-bold text-yellow-600 text-center mb-3">Elderly Care</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>✔ Assistance with daily activities</li>
        <li>✔ Administering medication under guidance</li>
        <li>✔ Companionship & emotional support</li>
        <li>✔ Emergency response training</li>
        <li>✔ Respectful communication</li>
      </ul>
    </div>

    <!-- Housekeeping -->
    <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-400">
      <div class="flex items-center justify-center w-16 h-16 bg-pink-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">🏡</span>
      </div>
      <h2 class="text-xl font-bold text-pink-600 text-center mb-3">Housekeeping</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>✔ Proper cleaning techniques</li>
        <li>✔ Laundry & ironing care</li>
        <li>✔ Safe use of cleaning equipment</li>
        <li>✔ Meal preparation & cooking basics</li>
        <li>✔ Maintaining a hygienic home</li>
      </ul>
    </div>

  </div>

  <!-- Why Choose Us -->
  <div class="mt-16 max-w-5xl mx-auto px-6 text-center">
    <h3 class="text-2xl font-bold text-pink-600 mb-4 animate-fadeIn delay-600">
      Why Choose Our Training?
    </h3>
    <div class="grid md:grid-cols-3 gap-6">
      <div class="p-4 bg-yellow-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-yellow-600">Comprehensive Courses</p>
        <p class="text-gray-600 text-sm">Designed for real-world caregiving skills.</p>
      </div>
      <div class="p-4 bg-pink-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-pink-600">Experienced Trainers</p>
        <p class="text-gray-600 text-sm">Guidance from professionals in caregiving.</p>
      </div>
      <div class="p-4 bg-yellow-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-yellow-600">Confidence & Trust</p>
        <p class="text-gray-600 text-sm">Peace of mind for both helpers & families.</p>
      </div>
    </div>
  </div>
</section>

<style>
  /* Simple fade and slide animations */
  @keyframes fadeIn {
    0% { opacity: 0; transform: translateY(10px); }
    100% { opacity: 1; transform: translateY(0); }
  }
  @keyframes slideUp {
    0% { opacity: 0; transform: translateY(40px); }
    100% { opacity: 1; transform: translateY(0); }
  }

  .animate-fadeIn {
    animation: fadeIn 1s ease forwards;
  }
  .animate-slideUp {
    animation: slideUp 1s ease forwards;
  }
  .delay-200 { animation-delay: 0.2s; }
  .delay-400 { animation-delay: 0.4s; }
  .delay-600 { animation-delay: 0.6s; }
</style>
