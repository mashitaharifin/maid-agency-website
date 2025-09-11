<script lang="ts">
  export let form;
  import "/src/app.css"
  let showPassword = false;
</script>

<svelte:head>
  <title>Admin Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</svelte:head>

<section class="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-400 via-pink-300 to-yellow-200">
  <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
    <h2 class="text-xl font-bold text-center text-gray-500">Maid Search Singapore Pte Ltd</h2>
    <h1 class="text-xl font-bold text-center mb-6 text-pink-300">Admin Login</h1>

    <form method="POST" class="flex flex-col space-y-4">
      <!-- Username -->
      <div>
        <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
        <input
          id="username"
          name="username"
          type="text"
          required
          class="mt-1 w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-400"
        />
      </div>

      <!-- Password with toggle -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <div class="relative">
          <input
            id="password"
            name="password"
            type={showPassword ? "text" : "password"}
            required
            class="mt-1 w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-400 pr-10"
          />
          <button
            type="button"
            class="absolute inset-y-0 right-3 flex items-center text-gray-500 hover:text-gray-700"
            on:click={() => (showPassword = !showPassword)}
          >
            {#if showPassword}
              👁️
            {:else}
              🙈
            {/if}
          </button>
        </div>
      </div>

      <!-- Error message -->
      {#if form?.message}
        <p class="text-red-600 text-sm">{form.message}</p>
      {/if}

      <!-- Submit -->
      <button
        type="submit"
        class="rounded-2xl bg-pink-300 hover:bg-gradient-to-r from-[#f5b9dd] to-[#e9cc6f] text-white font-semibold py-2 px-6 transition-all duration-300">Login
      </button>
    </form>
  </div>
</section>
