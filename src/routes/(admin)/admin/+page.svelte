<script lang="ts">
  export const data = {
    title: "Admin Dashboard"
  };
</script>

<div class="grid md:grid-cols-3 gap-6">
  <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow p-6">
    <h2 class="text-lg font-semibold text-gray-700">Users</h2>
    <p class="text-gray-600 mt-2">Manage and view all registered users.</p>
  </div>
  <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow p-6">
    <h2 class="text-lg font-semibold text-gray-700">Content</h2>
    <p class="text-gray-600 mt-2">Edit homepage, services, and more.</p>
  </div>
  <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow p-6">
    <h2 class="text-lg font-semibold text-gray-700">Settings</h2>
    <p class="text-gray-600 mt-2">Update site configuration and preferences.</p>
  </div>
</div>
