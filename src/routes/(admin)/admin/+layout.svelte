<script lang="ts">
  export let data: { title?: string; user: { id: string; username: string } };
  import "../../../app.css";

  import {
    LayoutDashboard,
    Home,
    Info,
    Briefcase,
    Users,
    ShieldCheck,
    GraduationCap,
    Search,
    Settings,
    LogOut,
    Menu,
    X,
    ChevronDown,
    ChevronRight
  } from "lucide-svelte";

  let sidebarOpen = true;
  let servicesOpen = true; 
</script>

<style>
  .container {
    max-width: 1400px;
    margin: 0 auto;
    margin-top: 2.5rem;
    padding: 2rem;
  }

  .menu-hover:hover {
    background: linear-gradient(to right, #f5b9dd, #e9cc6f);
    color: white;
  }
</style>

<div class="flex min-h-screen bg-gradient-to-br from-pink-300 via-pink-200 to-yellow-100">
  <!-- Sidebar -->
  <aside
    class={`transition-all duration-300 ${
      sidebarOpen ? "w-64" : "w-20"
    } bg-white/80 backdrop-blur-md shadow-lg flex flex-col`}
  >
    <!-- Logo / Title -->
    <div class="flex items-center justify-center p-6 border-b">
      {#if sidebarOpen}
        <h2 class="text-xl font-bold text-gray-800">Menu</h2>
      {/if}
    </div>

    <!-- Nav -->
    <nav class="flex-1 p-4 space-y-2">
      <!-- Dashboard -->
      <a href="/admin" class="flex items-center gap-3 p-2 rounded-lg menu-hover text-gray-700">
        <LayoutDashboard class="w-5 h-5" />
        {#if sidebarOpen}<span>Dashboard</span>{/if}
      </a>

      <!-- Home -->
      <a href="/admin/home" class="flex items-center gap-3 p-2 rounded-lg menu-hover text-gray-700">
        <Home class="w-5 h-5" />
        {#if sidebarOpen}<span>Home</span>{/if}
      </a>

      <!-- About -->
      <a href="/admin/about" class="flex items-center gap-3 p-2 rounded-lg menu-hover text-gray-700">
        <Info class="w-5 h-5" />
        {#if sidebarOpen}<span>About</span>{/if}
      </a>

      <!-- Services (Dropdown) -->
      <div>
        <button
          class="flex items-center justify-between w-full p-2 rounded-lg menu-hover text-gray-700"
          on:click={() => (servicesOpen = !servicesOpen)}
        >
          <div class="flex items-center gap-3">
            <Briefcase class="w-5 h-5" />
            {#if sidebarOpen}<span>Services</span>{/if}
          </div>
          {#if sidebarOpen}
            {#if servicesOpen}
              <ChevronDown class="w-4 h-4 text-gray-500" />
            {:else}
              <ChevronRight class="w-4 h-4 text-gray-500" />
            {/if}
          {/if}
        </button>

        {#if servicesOpen}
          <div class="ml-8 mt-2 space-y-2">
            <a href="/admin/services/maids" class="flex items-center gap-2 p-2 rounded-lg menu-hover text-gray-600 text-sm">
              <Users class="w-4 h-4" /> {#if sidebarOpen}<span>Maid</span>{/if}
            </a>
            <a href="/admin/services/insurance" class="flex items-center gap-2 p-2 rounded-lg menu-hover text-gray-600 text-sm">
              <ShieldCheck class="w-4 h-4" /> {#if sidebarOpen}<span>Insurance</span>{/if}
            </a>
            <a href="/admin/services/training" class="flex items-center gap-2 p-2 rounded-lg menu-hover text-gray-600 text-sm">
              <GraduationCap class="w-4 h-4" /> {#if sidebarOpen}<span>Pre-Employment Training</span>{/if}
            </a>
          </div>
        {/if}
      </div>

      <!-- Find Helper -->
      <a href="/admin/findhelper" class="flex items-center gap-3 p-2 rounded-lg menu-hover text-gray-700">
        <Search class="w-5 h-5" />
        {#if sidebarOpen}<span>Find Helper</span>{/if}
      </a>

      <!-- Settings -->
      <a href="/admin/settings" class="flex items-center gap-3 p-2 rounded-lg menu-hover text-gray-700">
        <Settings class="w-5 h-5" />
        {#if sidebarOpen}<span>Settings</span>{/if}
      </a>
    </nav>

    <!-- Logout -->
    <form method="POST" action="/logout" class="p-4 border-t">
      <button
        class="flex items-center gap-3 w-full p-2 rounded-lg menu-hover text-red-600"
      >
        <LogOut class="w-5 h-5" />
        {#if sidebarOpen}<span>Logout</span>{/if}
      </button>
    </form>
  </aside>

  <!-- Topbar -->
  <div class="flex-1 flex flex-col">
    <header class="bg-white/80 backdrop-blur-md shadow p-4 flex justify-between items-center">
      <div class="flex items-center gap-4">
        <!-- Sidebar Toggle Button (always visible here) -->
        <button
          class="p-2 rounded-lg hover:bg-gray-100"
          on:click={() => (sidebarOpen = !sidebarOpen)}
        >
          {#if sidebarOpen}
            <X class="w-5 h-5 text-gray-600" />
          {:else}
            <Menu class="w-5 h-5 text-gray-600" />
          {/if}
        </button>

        <h1 class="text-lg font-semibold text-gray-800">
          {data?.title ?? "Maid Search Singapore Pte Ltd | Admin Panel"}
        </h1>
      </div>

      <div class="flex items-center gap-4">
        <span class="text-gray-600">Hi, administrator</span>
        <!-- Avatar with initial -->
        <div class="w-8 h-8 flex items-center justify-center rounded-full bg-white text-pink-500 font-bold shadow">
          A
        </div>
      </div>
    </header>

    <main class="flex-1">
      <div class="container">
        <slot />
      </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white/80 backdrop-blur-md shadow-inner p-4 text-center text-sm text-gray-500">
      © {new Date().getFullYear()} Maid Search Singapore. All rights reserved.
    </footer>
  </div>
</div>