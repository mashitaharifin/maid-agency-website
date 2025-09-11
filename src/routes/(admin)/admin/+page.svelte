<script lang="ts">
    import dayjs from "dayjs";
    import utc from "dayjs/plugin/utc";
    import timezone from "dayjs/plugin/timezone";

    dayjs.extend(utc);
    dayjs.extend(timezone);

    // svelte-ignore export_let_unused
    export let data: {
    activities: { id: number; icon: string; title: string; createdAt: string }[];
    };

    // helper function for formatting with dayjs
    function formatDate(dateValue: string | number | dayjs.Dayjs | Date | null | undefined) {
        if (!dateValue) return ""; 
         return dayjs.utc(dateValue).format("YYYY-MM-DD HH:mm");
    }
    console.log("Activities:", data.activities);

    // --- Pagination Variables ---
    let currentPage = 1;
    const itemsPerPage = 5; 
    $: totalItems = data.activities.length;
    $: totalPages = Math.ceil(totalItems / itemsPerPage);

    // computed slice of activities for current page
    $: paginatedActivities = data.activities.slice(
        (currentPage - 1) * itemsPerPage,
        currentPage * itemsPerPage
    );

    function goToPage(page: number) {
        if (page >= 1 && page <= totalPages) {
        currentPage = page;
        console.log("Navigated to page:", page); // Add for debugging
        }
    }

    // Reset to page 1 when data changes
    $: if (data.activities) {
        currentPage = 1;
    }
</script>

<svelte:head>
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</svelte:head>

<style>
    :global(:root) {
        --pink-600: #db2777;
        --pink-300: #f9a8d4;
        --yellow-400: #fbbf24;
        --dark: #1f2937;
        --darker: #111827;
        --light: #f9fafb;
        --gray: #9ca3af;
        --gray-light: #f3f4f6;
        --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.05), 0 1px 3px rgba(0, 0, 0, 0.1);
        --card-shadow-hover: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);
    }

    :global(body) {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #fdf2f8 0%, #fce7f3 100%);
        min-height: 100vh;
        color: var(--dark);
        padding: 0;
        margin: 0;
    }

    .container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 2rem;
    }

    /* Topbar Styles */
    .topbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        background: white;
        padding: 1rem 2rem;
        border-radius: 16px;
        box-shadow: var(--card-shadow);
        background: linear-gradient(to right, #ffffff, #fdf2f8);
    }

    .user-info {
        display: flex;
        align-items: center;
    }

    .user-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: linear-gradient(45deg, var(--pink-600), var(--pink-300));
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: 600;
        font-size: 1.25rem;
        margin-right: 1rem;
    }

    .welcome-text h1 {
        font-size: 1.5rem;
        font-weight: 600;
        background: linear-gradient(45deg, var(--pink-600), #ec4899);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .welcome-text p {
        color: var(--gray);
        font-size: 0.875rem;
    }

    .topbar-actions {
        display: flex;
        gap: 1rem;
    }

    .btn-notification {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        border: none;
        background: var(--gray-light);
        color: var(--pink-600);
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }

    .btn-notification:hover {
        background: linear-gradient(to right, #f5b9dd, #e9cc6f);;
        color: white;
    }

    /* Quick Actions */
    .quick-actions {
        background: white;
        border-radius: 16px;
        padding: 2rem;
        box-shadow: var(--card-shadow);
        margin-bottom: 2rem;
    }

    .section-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        color: var(--pink-600);
    }

    .section-title i {
        margin-right: 0.75rem;
        background: linear-gradient(45deg, var(--pink-600), var(--yellow-400));
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .actions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 1rem;
    }

    .action-btn {
        display: flex;
        align-items: center;
        padding: 1.25rem;
        background: var(--gray-light);
        border-radius: 12px;
        transition: all 0.2s ease;
        cursor: pointer;
        border: none;
        width: 100%;
        text-align: left;
        font-family: 'Inter', sans-serif;
        text-decoration: none;
        color: inherit;
    }

    .action-btn:hover {
        background: linear-gradient(to right, #f5b9dd, #e9cc6f);
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(219, 39, 119, 0.2);
    }

    .action-btn i {
        margin-right: 0.75rem;
        font-size: 1.25rem;
        width: 24px;
    }

    /* Recent Activity */
    .recent-activity {
        background: white;
        border-radius: 16px;
        padding: 2rem;
        box-shadow: var(--card-shadow);
    }

    .activity-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .activity-item {
        display: flex;
        padding: 1rem 0;
        border-bottom: 1px solid #f3f4f6;
    }

    .activity-item:last-child {
        border-bottom: none;
    }

    .activity-icon {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        background: var(--pink-300);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1rem;
        flex-shrink: 0;
    }

    .activity-content {
        flex: 1;
    }

    .activity-title {
        font-weight: 500;
        margin-bottom: 0.25rem;
    }

    .activity-time {
        color: var(--gray);
        font-size: 0.875rem;
    }

    /* Responsive */
    @media (max-width: 1024px) {
        .dashboard-container {
            padding: 1.5rem;
        } 
    }

    @media (max-width: 768px) {             
        .actions-grid {
            grid-template-columns: 1fr;
        }
        
        .topbar {
            flex-direction: column;
            text-align: center;
            gap: 1rem;
        }
        
        .user-info {
            flex-direction: column;
        }
        
        .user-avatar {
            margin-right: 0;
            margin-bottom: 0.5rem;
        }
    }
</style>

    <!-- Topbar -->
    <div class="topbar">
        <div class="user-info">
            <div class="user-avatar">A</div>
            <div class="welcome-text">
                <h1>Welcome, Admin!</h1>
                <p>This is your admin control panel. Manage the client-side experience from the forms on each page. Any edits you make here will be reflected immediately after saving.</p>
            </div>
        </div>
        <div class="topbar-actions">
            <!-- svelte-ignore a11y_consider_explicit_label -->
            <button class="btn-notification">
                <i class="fas fa-bell"></i>
            </button>
            <!-- svelte-ignore a11y_consider_explicit_label -->
            <button class="btn-notification">
                <i class="fas fa-cog"></i>
            </button>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
        <h2 class="section-title">
            <i class="fas fa-bolt"></i>
            Quick Actions
        </h2>
        
        <div class="actions-grid">
            <a href="/admin/home" class="action-btn">
                <i class="fas fa-home"></i>
                <span>Edit Home Page</span>
            </a>
            
            <a href="/admin/about" class="action-btn">
                <i class="fas fa-info-circle"></i>
                <span>Edit About Page</span>
            </a>
            
            <a href="/admin/services/maids" class="action-btn">
                <i class="fas fa-user-md"></i>
                <span>Edit Maids</span>
            </a>
            
            <a href="/admin/services/insurance" class="action-btn">
                <i class="fas fa-shield-alt"></i>
                <span>Edit Insurance</span>
            </a>
            
            <a href="/admin/services/training" class="action-btn">
                <i class="fas fa-graduation-cap"></i>
                <span>Edit Pre-Employment Training</span>
            </a>
            
            <a href="/admin/findhelper" class="action-btn">
                <i class="fas fa-hands-helping"></i>
                <span>Edit Find Helper Page</span>
            </a>

            <a href="/admin/settings" class="action-btn">
                <i class="fas fa-cog"></i>
                <span>Edit Settings</span>
            </a>
        </div>
    </div>

    <!-- Recent Activity -->
<div class="recent-activity">
  <h2 class="section-title flex items-center gap-2">
    <i class="fas fa-history"></i>
    Recent Activity
  </h2>

  <ul class="activity-list divide-y divide-gray-200 dark:divide-white/10">
    {#each paginatedActivities as activity}
      <li class="activity-item flex gap-3 py-3">
        <div class="activity-icon text-pink-500">
          <i class="fas fa-{activity.icon}"></i>
        </div>
        <div class="activity-content">
          <h3 class="activity-title font-semibold">{activity.title}</h3>
          <p class="activity-time text-sm text-gray-500">{formatDate(activity.createdAt)}</p>
        </div>
      </li>
    {/each}
  </ul>

  <!-- Pagination -->
<div class="mt-4 flex items-center justify-between border-t border-gray-200 bg-white px-4 py-3 sm:px-6 dark:border-white/10 dark:bg-transparent">
    <div class="flex-1 flex justify-between sm:hidden">
        <button
            class="px-4 py-2 text-sm font-medium rounded-md border dark:border-white/10 {currentPage === 1 ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}"
            on:click={() => goToPage(currentPage - 1)}
            disabled={currentPage === 1}
        >
            Previous
        </button>
        <button
            class="px-4 py-2 text-sm font-medium rounded-md border dark:border-white/10 {currentPage === totalPages ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}"
            on:click={() => goToPage(currentPage + 1)}
            disabled={currentPage === totalPages}
        >
            Next
        </button>
    </div>
    <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
      <p class="text-sm text-gray-700 dark:text-gray-300">
        Showing
        <span class="font-medium">{(currentPage - 1) * itemsPerPage + 1}</span>
        to
        <span class="font-medium">{Math.min(currentPage * itemsPerPage, totalItems)}</span>
        of
        <span class="font-medium">{totalItems}</span>
        results
      </p>

      <nav class="isolate inline-flex -space-x-px rounded-md shadow-xs dark:shadow-none" aria-label="Pagination">
        <!-- Previous -->
        <button
          on:click={() => goToPage(currentPage - 1)}
          class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 hover:bg-gray-50 dark:hover:bg-white/5"
          disabled={currentPage === 1}
        >
          <span class="sr-only">Previous</span>
          ◀
        </button>

        {#each Array(totalPages) as _, i}
          <button
            on:click={() => goToPage(i + 1)}
            class="relative inline-flex items-center px-4 py-2 text-sm font-semibold
              {currentPage === i + 1 
                ? 'z-10 bg-pink-300 text-white'
                : 'text-gray-900 hover:bg-gray-50 dark:text-gray-200 dark:hover:bg-white/5'}"
          >
            {i + 1}
          </button>
        {/each}

        <!-- Next -->
        <button
          on:click={() => goToPage(currentPage + 1)}
          class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 hover:bg-gray-50 dark:hover:bg-white/5"
          disabled={currentPage === totalPages}
        >
          <span class="sr-only">Next</span>
          ▶
        </button>
      </nav>
    </div>
  </div>
</div>
