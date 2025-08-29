<script lang="ts">
  export let form;
  let showPassword = false;
</script>

<section class="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-400 via-pink-300 to-yellow-300">
  <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
    <h1 class="text-2xl font-bold text-center mb-6 text-gray-800">Login</h1>

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
      {#if form?.error}
        <p class="text-red-600 text-sm">{form.error}</p>
      {/if}

      <!-- Submit -->
      <button
        type="submit"
        class="rounded-2xl bg-pink-500 hover:bg-yellow-400 text-white font-semibold py-2 transition-colors"
      >
        Login
      </button>
    </form>
  </div>
</section>
