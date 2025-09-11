<script lang="ts">
  import { Settings } from "lucide-svelte";

  // Data from +page.server.ts
  export let data: {
    settings: {
      id: number;
      logoUrl: string | null;
      agencyName: string | null;
      whatsappLink: string | null;
      facebookLink: string | null;
      phone: string | null;
      licenseNo: string | null;
      companyNo: string | null;
      empRegNo: string | null;
      copyright: string | null;
    }
  };

  // Action return values
  export let form;

  let editingNavbar = false;
  let editingFooter = false;

  let draft = structuredClone(data.settings);

  function cancel(section: string) {
    draft = structuredClone(data.settings);
    if (section === "navbar") editingNavbar = false;
    if (section === "footer") editingFooter = false;
  }
</script>

<svelte:head>
  <title>Settings</title>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
    rel="stylesheet"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
</svelte:head>

<!-- SUCCESS / ERROR MESSAGE -->
{#if form?.success}
  <div class="p-3 mb-4 rounded bg-green-100 text-green-700">
    {form.message}
  </div>
{:else if form?.error}
  <div class="p-3 mb-4 rounded bg-red-100 text-red-700">
    {form.error}
  </div>
{/if}

<!-- HEADER -->
<section class="bg-white p-6 rounded-2xl shadow mb-6">
  <div class="flex items-center gap-4">
    <div class="p-2 bg-pink-100 rounded-xl">
      <Settings class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Settings</h1>
      <p class="text-gray-600 text-sm">
        This page provides the details of global contents.
      </p>
    </div>
  </div>
</section>

<div class="space-y-10">
  <!-- NAVBAR SETTINGS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Navbar Settings</h2>
      {#if !editingNavbar}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingNavbar = true)}
          >✏️ Edit</button
        >
      {/if}
    </div>

    {#if editingNavbar}
      <form method="post">
        <input type="hidden" name="id" value={data.settings.id} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mb-2">Logo URL</label>
        <input
          type="text"
          name="logoUrl"
          bind:value={draft.logoUrl}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Agency Name</label>
        <input
          type="text"
          name="agencyName"
          bind:value={draft.agencyName}
          class="w-full p-2 border rounded"
        />

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            formaction="?/updateNavbar"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("navbar")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p><b>Logo URL:</b> {data.settings.logoUrl}</p>
      <p><b>Agency Name:</b> {data.settings.agencyName}</p>
    {/if}
  </section>

  <!-- FOOTER SETTINGS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Footer Settings</h2>
      {#if !editingFooter}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingFooter = true)}
          >✏️ Edit</button
        >
      {/if}
    </div>

    {#if editingFooter}
      <form method="post">
        <input type="hidden" name="id" value={data.settings.id} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mb-2">WhatsApp Link</label>
        <input
          type="text"
          name="whatsappLink"
          bind:value={draft.whatsappLink}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Facebook Link</label>
        <input
          type="text"
          name="facebookLink"
          bind:value={draft.facebookLink}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Phone</label>
        <input
          type="text"
          name="phone"
          bind:value={draft.phone}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">License No</label>
        <input
          type="text"
          name="licenseNo"
          bind:value={draft.licenseNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Company Registration No</label>
        <input
          type="text"
          name="companyNo"
          bind:value={draft.companyNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Employment Agency Reg No</label>
        <input
          type="text"
          name="empRegNo"
          bind:value={draft.empRegNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Copyright</label>
        <input
          type="text"
          name="copyright"
          bind:value={draft.copyright}
          class="w-full p-2 border rounded"
        />

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            formaction="?/updateFooter"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("footer")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p><b>WhatsApp:</b> {data.settings.whatsappLink}</p>
      <p><b>Facebook:</b> {data.settings.facebookLink}</p>
      <p><b>Phone:</b> {data.settings.phone}</p>
      <p><b>License No:</b> {data.settings.licenseNo}</p>
      <p><b>Company No:</b> {data.settings.companyNo}</p>
      <p><b>Employment Reg No:</b> {data.settings.empRegNo}</p>
      <p><b>Copyright:</b> {data.settings.copyright}</p>
    {/if}
  </section>
</div>
