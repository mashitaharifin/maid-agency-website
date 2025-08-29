<script lang="ts">
  export let data: { title?: string };
  import "../../../app.css";
</script>

<div class="flex min-h-screen bg-gradient-to-br from-pink-400 via-pink-300 to-yellow-300">
  <!-- Sidebar -->
  <aside class="w-64 bg-white/80 backdrop-blur-md shadow-lg p-6 space-y-6">
    <h2 class="text-2xl font-bold text-gray-800">Admin</h2>
    <nav class="space-y-4">
      <a href="/admin" class="block text-gray-700 hover:text-pink-600">Dashboard</a>
      <a href="/admin/maids" class="block text-gray-700 hover:text-pink-600">Maids</a>
      <a href="/admin/services" class="block text-gray-700 hover:text-pink-600">Services</a>
      <a href="/admin/reviews" class="block text-gray-700 hover:text-pink-600">Reviews</a>
      <a href="/admin/about" class="block text-gray-700 hover:text-pink-600">About</a>
      <a href="/admin/settings" class="block text-gray-700 hover:text-pink-600">Settings</a>
    </nav>
  </aside>

  <!-- Main content wrapper -->
  <div class="flex-1 flex flex-col">
    <!-- Topbar -->
    <header class="bg-white/80 backdrop-blur-md shadow p-4 flex justify-between items-center">
      <h1 class="text-xl font-bold text-gray-800">{data?.title ?? 'Admin Panel'}</h1>
      <form method="POST" action="/logout">
        <button class="bg-pink-500 hover:bg-pink-600 text-white px-4 py-2 rounded-lg">
          Logout
        </button>
      </form>
    </header>

    <!-- Page Content -->
    <main class="flex-1 p-6">
      <slot />
    </main>
  </div>
</div>
