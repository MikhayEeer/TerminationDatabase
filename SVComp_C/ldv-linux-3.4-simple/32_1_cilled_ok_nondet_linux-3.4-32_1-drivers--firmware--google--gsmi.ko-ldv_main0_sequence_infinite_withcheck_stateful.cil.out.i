extern void abort(void);

extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));

void reach_error() { ((void) sizeof ((0) ? 1 : 0), __extension__ ({ if (0) ; else __assert_fail ("0", "32_1_cilled_ok_nondet_linux-3.4-32_1-drivers--firmware--google--gsmi.ko-ldv_main0_sequence_infinite_withcheck_stateful.cil.out.c", 3, __extension__ __PRETTY_FUNCTION__); })); }
typedef signed char __s8;
typedef short __s16;
typedef unsigned short __u16;
typedef int __s32;
typedef unsigned int __u32;
typedef long long __s64;
typedef unsigned long long __u64;
typedef unsigned char u8;
typedef short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef long long s64;
typedef unsigned long long u64;
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;
typedef int __kernel_pid_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_time_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef __u32 __kernel_dev_t;
typedef __kernel_dev_t dev_t;
typedef unsigned short umode_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_clockid_t clockid_t;
typedef _Bool bool;
typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_loff_t loff_t;
typedef __kernel_size_t size_t;
typedef __kernel_ssize_t ssize_t;
typedef __kernel_time_t time_t;
typedef __s32 int32_t;
typedef __u32 uint32_t;
typedef unsigned long sector_t;
typedef unsigned long blkcnt_t;
typedef u64 dma_addr_t;
typedef unsigned int gfp_t;
typedef unsigned int fmode_t;
typedef u64 phys_addr_t;
typedef phys_addr_t resource_size_t;
struct __anonstruct_atomic_t_7 {
   int counter ;
};
typedef struct __anonstruct_atomic_t_7 atomic_t;
struct __anonstruct_atomic64_t_8 {
   long counter ;
};
typedef struct __anonstruct_atomic64_t_8 atomic64_t;
struct list_head {
   struct list_head *next ;
   struct list_head *prev ;
};
struct hlist_node;
struct hlist_head {
   struct hlist_node *first ;
};
struct hlist_node {
   struct hlist_node *next ;
   struct hlist_node **pprev ;
};
struct rcu_head {
   struct rcu_head *next ;
   void (*func)(struct rcu_head *head ) ;
};
struct module;
struct module;
typedef void (*ctor_fn_t)(void);
struct device;
struct device;
struct completion;
struct completion;
struct pt_regs;
struct pt_regs;
struct atomic_notifier_head;
struct pid;
struct pid;
struct resource {
   resource_size_t start ;
   resource_size_t end ;
   char const *name ;
   unsigned long flags ;
   struct resource *parent ;
   struct resource *sibling ;
   struct resource *child ;
};
struct device;
struct task_struct;
struct task_struct;
struct lock_class_key {
};
struct sock;
struct sock;
struct kobject;
struct kobject;
enum kobj_ns_type {
    KOBJ_NS_TYPE_NONE = 0,
    KOBJ_NS_TYPE_NET = 1,
    KOBJ_NS_TYPES = 2
} ;
struct kobj_ns_type_operations {
   enum kobj_ns_type type ;
   void *(*grab_current_ns)(void) ;
   void const *(*netlink_ns)(struct sock *sk ) ;
   void const *(*initial_ns)(void) ;
   void (*drop_ns)(void * ) ;
};
struct task_struct;
struct mm_struct;
struct mm_struct;
struct pt_regs {
   unsigned long r15 ;
   unsigned long r14 ;
   unsigned long r13 ;
   unsigned long r12 ;
   unsigned long bp ;
   unsigned long bx ;
   unsigned long r11 ;
   unsigned long r10 ;
   unsigned long r9 ;
   unsigned long r8 ;
   unsigned long ax ;
   unsigned long cx ;
   unsigned long dx ;
   unsigned long si ;
   unsigned long di ;
   unsigned long orig_ax ;
   unsigned long ip ;
   unsigned long cs ;
   unsigned long flags ;
   unsigned long sp ;
   unsigned long ss ;
};
struct __anonstruct____missing_field_name_11 {
   unsigned int a ;
   unsigned int b ;
};
struct __anonstruct____missing_field_name_12 {
   u16 limit0 ;
   u16 base0 ;
   unsigned int base1 : 8 ;
   unsigned int type : 4 ;
   unsigned int s : 1 ;
   unsigned int dpl : 2 ;
   unsigned int p : 1 ;
   unsigned int limit : 4 ;
   unsigned int avl : 1 ;
   unsigned int l : 1 ;
   unsigned int d : 1 ;
   unsigned int g : 1 ;
   unsigned int base2 : 8 ;
};
union __anonunion____missing_field_name_10 {
   struct __anonstruct____missing_field_name_11 __annonCompField4 ;
   struct __anonstruct____missing_field_name_12 __annonCompField5 ;
};
struct desc_struct {
   union __anonunion____missing_field_name_10 __annonCompField6 ;
} __attribute__((__packed__)) ;
typedef unsigned long pgdval_t;
typedef unsigned long pgprotval_t;
struct pgprot {
   pgprotval_t pgprot ;
};
typedef struct pgprot pgprot_t;
struct __anonstruct_pgd_t_16 {
   pgdval_t pgd ;
};
typedef struct __anonstruct_pgd_t_16 pgd_t;
struct page;
typedef struct page *pgtable_t;
struct file;
struct file;
struct seq_file;
struct seq_file;
struct page;
struct thread_struct;
struct thread_struct;
struct mm_struct;
struct desc_struct;
struct task_struct;
struct cpumask;
struct cpumask;
struct arch_spinlock;
struct arch_spinlock;
struct task_struct;
struct kernel_vm86_regs {
   struct pt_regs pt ;
   unsigned short es ;
   unsigned short __esh ;
   unsigned short ds ;
   unsigned short __dsh ;
   unsigned short fs ;
   unsigned short __fsh ;
   unsigned short gs ;
   unsigned short __gsh ;
};
union __anonunion____missing_field_name_20 {
   struct pt_regs *regs ;
   struct kernel_vm86_regs *vm86 ;
};
struct math_emu_info {
   long ___orig_eip ;
   union __anonunion____missing_field_name_20 __annonCompField7 ;
};
struct task_struct;
struct page;
struct bug_entry {
   int bug_addr_disp ;
   int file_disp ;
   unsigned short line ;
   unsigned short flags ;
};
struct pt_regs;
struct cpumask {
   unsigned long bits[((4096UL + 8UL * sizeof(long )) - 1UL) / (8UL * sizeof(long ))] ;
};
typedef struct cpumask cpumask_t;
typedef struct cpumask *cpumask_var_t;
struct static_key;
struct static_key;
struct pt_regs;
struct seq_operations;
struct i387_fsave_struct {
   u32 cwd ;
   u32 swd ;
   u32 twd ;
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
   u32 st_space[20] ;
   u32 status ;
};
struct __anonstruct____missing_field_name_27 {
   u64 rip ;
   u64 rdp ;
};
struct __anonstruct____missing_field_name_28 {
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
};
union __anonunion____missing_field_name_26 {
   struct __anonstruct____missing_field_name_27 __annonCompField11 ;
   struct __anonstruct____missing_field_name_28 __annonCompField12 ;
};
union __anonunion____missing_field_name_29 {
   u32 padding1[12] ;
   u32 sw_reserved[12] ;
};
struct i387_fxsave_struct {
   u16 cwd ;
   u16 swd ;
   u16 twd ;
   u16 fop ;
   union __anonunion____missing_field_name_26 __annonCompField13 ;
   u32 mxcsr ;
   u32 mxcsr_mask ;
   u32 st_space[32] ;
   u32 xmm_space[64] ;
   u32 padding[12] ;
   union __anonunion____missing_field_name_29 __annonCompField14 ;
} __attribute__((__aligned__(16))) ;
struct i387_soft_struct {
   u32 cwd ;
   u32 swd ;
   u32 twd ;
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
   u32 st_space[20] ;
   u8 ftop ;
   u8 changed ;
   u8 lookahead ;
   u8 no_update ;
   u8 rm ;
   u8 alimit ;
   struct math_emu_info *info ;
   u32 entry_eip ;
};
struct ymmh_struct {
   u32 ymmh_space[64] ;
};
struct xsave_hdr_struct {
   u64 xstate_bv ;
   u64 reserved1[2] ;
   u64 reserved2[5] ;
} __attribute__((__packed__)) ;
struct xsave_struct {
   struct i387_fxsave_struct i387 ;
   struct xsave_hdr_struct xsave_hdr ;
   struct ymmh_struct ymmh ;
} __attribute__((__packed__, __aligned__(64))) ;
union thread_xstate {
   struct i387_fsave_struct fsave ;
   struct i387_fxsave_struct fxsave ;
   struct i387_soft_struct soft ;
   struct xsave_struct xsave ;
};
struct fpu {
   unsigned int last_cpu ;
   unsigned int has_fpu ;
   union thread_xstate *state ;
};
struct kmem_cache;
struct perf_event;
struct perf_event;
struct thread_struct {
   struct desc_struct tls_array[3] ;
   unsigned long sp0 ;
   unsigned long sp ;
   unsigned long usersp ;
   unsigned short es ;
   unsigned short ds ;
   unsigned short fsindex ;
   unsigned short gsindex ;
   unsigned long fs ;
   unsigned long gs ;
   struct perf_event *ptrace_bps[4] ;
   unsigned long debugreg6 ;
   unsigned long ptrace_dr7 ;
   unsigned long cr2 ;
   unsigned long trap_nr ;
   unsigned long error_code ;
   struct fpu fpu ;
   unsigned long *io_bitmap_ptr ;
   unsigned long iopl ;
   unsigned int io_bitmap_max ;
};
typedef atomic64_t atomic_long_t;
struct kobject;
struct module;
enum kobj_ns_type;
struct attribute {
   char const *name ;
   umode_t mode ;
};
struct attribute_group {
   char const *name ;
   umode_t (*is_visible)(struct kobject * , struct attribute * , int ) ;
   struct attribute **attrs ;
};
struct file;
struct vm_area_struct;
struct vm_area_struct;
struct bin_attribute {
   struct attribute attr ;
   size_t size ;
   void *private ;
   ssize_t (*read)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                   loff_t , size_t ) ;
   ssize_t (*write)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                    loff_t , size_t ) ;
   int (*mmap)(struct file * , struct kobject * , struct bin_attribute *attr , struct vm_area_struct *vma ) ;
};
struct sysfs_ops {
   ssize_t (*show)(struct kobject * , struct attribute * , char * ) ;
   ssize_t (*store)(struct kobject * , struct attribute * , char const * , size_t ) ;
   void const *(*namespace)(struct kobject * , struct attribute const * ) ;
};
struct sysfs_dirent;
struct sysfs_dirent;
struct timespec;
struct timespec;
struct task_struct;
typedef u16 __ticket_t;
typedef u32 __ticketpair_t;
struct __raw_tickets {
   __ticket_t head ;
   __ticket_t tail ;
};
union __anonunion____missing_field_name_36 {
   __ticketpair_t head_tail ;
   struct __raw_tickets tickets ;
};
struct arch_spinlock {
   union __anonunion____missing_field_name_36 __annonCompField17 ;
};
typedef struct arch_spinlock arch_spinlock_t;
struct __anonstruct____missing_field_name_38 {
   u32 read ;
   s32 write ;
};
union __anonunion_arch_rwlock_t_37 {
   s64 lock ;
   struct __anonstruct____missing_field_name_38 __annonCompField18 ;
};
typedef union __anonunion_arch_rwlock_t_37 arch_rwlock_t;
struct raw_spinlock {
   arch_spinlock_t raw_lock ;
   unsigned int magic ;
   unsigned int owner_cpu ;
   void *owner ;
};
typedef struct raw_spinlock raw_spinlock_t;
union __anonunion____missing_field_name_39 {
   struct raw_spinlock rlock ;
};
struct spinlock {
   union __anonunion____missing_field_name_39 __annonCompField19 ;
};
typedef struct spinlock spinlock_t;
struct __anonstruct_rwlock_t_40 {
   arch_rwlock_t raw_lock ;
   unsigned int magic ;
   unsigned int owner_cpu ;
   void *owner ;
};
typedef struct __anonstruct_rwlock_t_40 rwlock_t;
struct kref {
   atomic_t refcount ;
};
struct __wait_queue_head {
   spinlock_t lock ;
   struct list_head task_list ;
};
typedef struct __wait_queue_head wait_queue_head_t;
struct task_struct;
struct kset;
struct kobj_type;
struct kobject {
   char const *name ;
   struct list_head entry ;
   struct kobject *parent ;
   struct kset *kset ;
   struct kobj_type *ktype ;
   struct sysfs_dirent *sd ;
   struct kref kref ;
   unsigned int state_initialized : 1 ;
   unsigned int state_in_sysfs : 1 ;
   unsigned int state_add_uevent_sent : 1 ;
   unsigned int state_remove_uevent_sent : 1 ;
   unsigned int uevent_suppress : 1 ;
};
struct kobj_type {
   void (*release)(struct kobject *kobj ) ;
   struct sysfs_ops const *sysfs_ops ;
   struct attribute **default_attrs ;
   struct kobj_ns_type_operations const *(*child_ns_type)(struct kobject *kobj ) ;
   void const *(*namespace)(struct kobject *kobj ) ;
};
struct kobj_uevent_env {
   char *envp[32] ;
   int envp_idx ;
   char buf[2048] ;
   int buflen ;
};
struct kset_uevent_ops {
   int (* const filter)(struct kset *kset , struct kobject *kobj ) ;
   char const *(* const name)(struct kset *kset , struct kobject *kobj ) ;
   int (* const uevent)(struct kset *kset , struct kobject *kobj , struct kobj_uevent_env *env ) ;
};
struct kobj_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct kobject *kobj , struct kobj_attribute *attr , char *buf ) ;
   ssize_t (*store)(struct kobject *kobj , struct kobj_attribute *attr , char const *buf ,
                    size_t count ) ;
};
struct sock;
struct kset {
   struct list_head list ;
   spinlock_t list_lock ;
   struct kobject kobj ;
   struct kset_uevent_ops const *uevent_ops ;
};
struct klist_node;
struct klist_node;
struct klist_node {
   void *n_klist ;
   struct list_head n_node ;
   struct kref n_ref ;
};
struct mutex {
   atomic_t count ;
   spinlock_t wait_lock ;
   struct list_head wait_list ;
   struct task_struct *owner ;
   char const *name ;
   void *magic ;
};
struct mutex_waiter {
   struct list_head list ;
   struct task_struct *task ;
   void *magic ;
};
struct seqcount {
   unsigned int sequence ;
};
typedef struct seqcount seqcount_t;
struct timespec {
   __kernel_time_t tv_sec ;
   long tv_nsec ;
};
union ktime {
   s64 tv64 ;
};
typedef union ktime ktime_t;
struct tvec_base;
struct tvec_base;
struct timer_list {
   struct list_head entry ;
   unsigned long expires ;
   struct tvec_base *base ;
   void (*function)(unsigned long ) ;
   unsigned long data ;
   int slack ;
   int start_pid ;
   void *start_site ;
   char start_comm[16] ;
};
struct hrtimer;
struct hrtimer;
enum hrtimer_restart;
struct work_struct;
struct work_struct;
struct work_struct {
   atomic_long_t data ;
   struct list_head entry ;
   void (*func)(struct work_struct *work ) ;
};
struct delayed_work {
   struct work_struct work ;
   struct timer_list timer ;
};
struct completion {
   unsigned int done ;
   wait_queue_head_t wait ;
};
struct device;
struct pm_message {
   int event ;
};
typedef struct pm_message pm_message_t;
struct dev_pm_ops {
   int (*prepare)(struct device *dev ) ;
   void (*complete)(struct device *dev ) ;
   int (*suspend)(struct device *dev ) ;
   int (*resume)(struct device *dev ) ;
   int (*freeze)(struct device *dev ) ;
   int (*thaw)(struct device *dev ) ;
   int (*poweroff)(struct device *dev ) ;
   int (*restore)(struct device *dev ) ;
   int (*suspend_late)(struct device *dev ) ;
   int (*resume_early)(struct device *dev ) ;
   int (*freeze_late)(struct device *dev ) ;
   int (*thaw_early)(struct device *dev ) ;
   int (*poweroff_late)(struct device *dev ) ;
   int (*restore_early)(struct device *dev ) ;
   int (*suspend_noirq)(struct device *dev ) ;
   int (*resume_noirq)(struct device *dev ) ;
   int (*freeze_noirq)(struct device *dev ) ;
   int (*thaw_noirq)(struct device *dev ) ;
   int (*poweroff_noirq)(struct device *dev ) ;
   int (*restore_noirq)(struct device *dev ) ;
   int (*runtime_suspend)(struct device *dev ) ;
   int (*runtime_resume)(struct device *dev ) ;
   int (*runtime_idle)(struct device *dev ) ;
};
enum rpm_status {
    RPM_ACTIVE = 0,
    RPM_RESUMING = 1,
    RPM_SUSPENDED = 2,
    RPM_SUSPENDING = 3
} ;
enum rpm_request {
    RPM_REQ_NONE = 0,
    RPM_REQ_IDLE = 1,
    RPM_REQ_SUSPEND = 2,
    RPM_REQ_AUTOSUSPEND = 3,
    RPM_REQ_RESUME = 4
} ;
struct wakeup_source;
struct wakeup_source;
struct pm_subsys_data {
   spinlock_t lock ;
   unsigned int refcount ;
};
struct dev_pm_qos_request;
struct pm_qos_constraints;
struct dev_pm_info {
   pm_message_t power_state ;
   unsigned int can_wakeup : 1 ;
   unsigned int async_suspend : 1 ;
   bool is_prepared : 1 ;
   bool is_suspended : 1 ;
   bool ignore_children : 1 ;
   spinlock_t lock ;
   struct list_head entry ;
   struct completion completion ;
   struct wakeup_source *wakeup ;
   bool wakeup_path : 1 ;
   struct timer_list suspend_timer ;
   unsigned long timer_expires ;
   struct work_struct work ;
   wait_queue_head_t wait_queue ;
   atomic_t usage_count ;
   atomic_t child_count ;
   unsigned int disable_depth : 3 ;
   unsigned int idle_notification : 1 ;
   unsigned int request_pending : 1 ;
   unsigned int deferred_resume : 1 ;
   unsigned int run_wake : 1 ;
   unsigned int runtime_auto : 1 ;
   unsigned int no_callbacks : 1 ;
   unsigned int irq_safe : 1 ;
   unsigned int use_autosuspend : 1 ;
   unsigned int timer_autosuspends : 1 ;
   enum rpm_request request ;
   enum rpm_status runtime_status ;
   int runtime_error ;
   int autosuspend_delay ;
   unsigned long last_busy ;
   unsigned long active_jiffies ;
   unsigned long suspended_jiffies ;
   unsigned long accounting_timestamp ;
   ktime_t suspend_time ;
   s64 max_time_suspended_ns ;
   struct dev_pm_qos_request *pq_req ;
   struct pm_subsys_data *subsys_data ;
   struct pm_qos_constraints *constraints ;
};
struct dev_pm_domain {
   struct dev_pm_ops ops ;
};
struct dma_map_ops;
struct dev_archdata {
   void *acpi_handle ;
   struct dma_map_ops *dma_ops ;
   void *iommu ;
};
struct pdev_archdata {
};
struct device;
struct device_private;
struct device_private;
struct device_driver;
struct device_driver;
struct driver_private;
struct driver_private;
struct module;
struct class;
struct class;
struct subsys_private;
struct subsys_private;
struct bus_type;
struct bus_type;
struct device_node;
struct device_node;
struct iommu_ops;
struct iommu_ops;
struct bus_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct bus_type *bus , char *buf ) ;
   ssize_t (*store)(struct bus_type *bus , char const *buf , size_t count ) ;
};
struct device_attribute;
struct driver_attribute;
struct bus_type {
   char const *name ;
   char const *dev_name ;
   struct device *dev_root ;
   struct bus_attribute *bus_attrs ;
   struct device_attribute *dev_attrs ;
   struct driver_attribute *drv_attrs ;
   int (*match)(struct device *dev , struct device_driver *drv ) ;
   int (*uevent)(struct device *dev , struct kobj_uevent_env *env ) ;
   int (*probe)(struct device *dev ) ;
   int (*remove)(struct device *dev ) ;
   void (*shutdown)(struct device *dev ) ;
   int (*suspend)(struct device *dev , pm_message_t state ) ;
   int (*resume)(struct device *dev ) ;
   struct dev_pm_ops const *pm ;
   struct iommu_ops *iommu_ops ;
   struct subsys_private *p ;
};
struct device_type;
struct notifier_block;
struct notifier_block;
struct of_device_id;
struct device_driver {
   char const *name ;
   struct bus_type *bus ;
   struct module *owner ;
   char const *mod_name ;
   bool suppress_bind_attrs ;
   struct of_device_id const *of_match_table ;
   int (*probe)(struct device *dev ) ;
   int (*remove)(struct device *dev ) ;
   void (*shutdown)(struct device *dev ) ;
   int (*suspend)(struct device *dev , pm_message_t state ) ;
   int (*resume)(struct device *dev ) ;
   struct attribute_group const **groups ;
   struct dev_pm_ops const *pm ;
   struct driver_private *p ;
};
struct driver_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct device_driver *driver , char *buf ) ;
   ssize_t (*store)(struct device_driver *driver , char const *buf , size_t count ) ;
};
struct class_attribute;
struct class {
   char const *name ;
   struct module *owner ;
   struct class_attribute *class_attrs ;
   struct device_attribute *dev_attrs ;
   struct bin_attribute *dev_bin_attrs ;
   struct kobject *dev_kobj ;
   int (*dev_uevent)(struct device *dev , struct kobj_uevent_env *env ) ;
   char *(*devnode)(struct device *dev , umode_t *mode ) ;
   void (*class_release)(struct class *class ) ;
   void (*dev_release)(struct device *dev ) ;
   int (*suspend)(struct device *dev , pm_message_t state ) ;
   int (*resume)(struct device *dev ) ;
   struct kobj_ns_type_operations const *ns_type ;
   void const *(*namespace)(struct device *dev ) ;
   struct dev_pm_ops const *pm ;
   struct subsys_private *p ;
};
struct class_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct class *class , struct class_attribute *attr , char *buf ) ;
   ssize_t (*store)(struct class *class , struct class_attribute *attr , char const *buf ,
                    size_t count ) ;
   void const *(*namespace)(struct class *class , struct class_attribute const *attr ) ;
};
struct device_type {
   char const *name ;
   struct attribute_group const **groups ;
   int (*uevent)(struct device *dev , struct kobj_uevent_env *env ) ;
   char *(*devnode)(struct device *dev , umode_t *mode ) ;
   void (*release)(struct device *dev ) ;
   struct dev_pm_ops const *pm ;
};
struct device_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct device *dev , struct device_attribute *attr , char *buf ) ;
   ssize_t (*store)(struct device *dev , struct device_attribute *attr , char const *buf ,
                    size_t count ) ;
};
struct device_dma_parameters {
   unsigned int max_segment_size ;
   unsigned long segment_boundary_mask ;
};
struct dma_coherent_mem;
struct device {
   struct device *parent ;
   struct device_private *p ;
   struct kobject kobj ;
   char const *init_name ;
   struct device_type const *type ;
   struct mutex mutex ;
   struct bus_type *bus ;
   struct device_driver *driver ;
   void *platform_data ;
   struct dev_pm_info power ;
   struct dev_pm_domain *pm_domain ;
   int numa_node ;
   u64 *dma_mask ;
   u64 coherent_dma_mask ;
   struct device_dma_parameters *dma_parms ;
   struct list_head dma_pools ;
   struct dma_coherent_mem *dma_mem ;
   struct dev_archdata archdata ;
   struct device_node *of_node ;
   dev_t devt ;
   u32 id ;
   spinlock_t devres_lock ;
   struct list_head devres_head ;
   struct klist_node knode_class ;
   struct class *class ;
   struct attribute_group const **groups ;
   void (*release)(struct device *dev ) ;
};
struct wakeup_source {
   char const *name ;
   struct list_head entry ;
   spinlock_t lock ;
   struct timer_list timer ;
   unsigned long timer_expires ;
   ktime_t total_time ;
   ktime_t max_time ;
   ktime_t last_time ;
   unsigned long event_count ;
   unsigned long active_count ;
   unsigned long relax_count ;
   unsigned long hit_count ;
   unsigned int active : 1 ;
};
typedef unsigned long kernel_ulong_t;
struct of_device_id {
   char name[32] ;
   char type[32] ;
   char compatible[128] ;
   void *data ;
};
struct dmi_strmatch {
   unsigned char slot ;
   char substr[79] ;
};
struct dmi_system_id {
   int (*callback)(struct dmi_system_id const * ) ;
   char const *ident ;
   struct dmi_strmatch matches[4] ;
   void *driver_data ;
};
struct platform_device_id {
   char name[20] ;
   kernel_ulong_t driver_data __attribute__((__aligned__(sizeof(kernel_ulong_t )))) ;
};
struct mfd_cell;
struct mfd_cell;
struct platform_device {
   char const *name ;
   int id ;
   struct device dev ;
   u32 num_resources ;
   struct resource *resource ;
   struct platform_device_id const *id_entry ;
   struct mfd_cell *mfd_cell ;
   struct pdev_archdata archdata ;
};
struct platform_device_info {
   struct device *parent ;
   char const *name ;
   int id ;
   struct resource const *res ;
   unsigned int num_res ;
   void const *data ;
   size_t size_data ;
   u64 dma_mask ;
};
struct dma_attrs {
   unsigned long flags[((4UL + 8UL * sizeof(long )) - 1UL) / (8UL * sizeof(long ))] ;
};
enum dma_data_direction {
    DMA_BIDIRECTIONAL = 0,
    DMA_TO_DEVICE = 1,
    DMA_FROM_DEVICE = 2,
    DMA_NONE = 3
} ;
struct __anonstruct_nodemask_t_45 {
   unsigned long bits[(((unsigned long )(1 << 10) + 8UL * sizeof(long )) - 1UL) / (8UL * sizeof(long ))] ;
};
typedef struct __anonstruct_nodemask_t_45 nodemask_t;
struct page;
struct rw_semaphore;
struct rw_semaphore;
struct rw_semaphore {
   long count ;
   raw_spinlock_t wait_lock ;
   struct list_head wait_list ;
};
struct notifier_block;
struct notifier_block {
   int (*notifier_call)(struct notifier_block * , unsigned long , void * ) ;
   struct notifier_block *next ;
   int priority ;
};
struct atomic_notifier_head {
   spinlock_t lock ;
   struct notifier_block *head ;
};
struct page;
struct device;
struct __anonstruct_mm_context_t_113 {
   void *ldt ;
   int size ;
   unsigned short ia32_compat ;
   struct mutex lock ;
   void *vdso ;
};
typedef struct __anonstruct_mm_context_t_113 mm_context_t;
struct vm_area_struct;
struct page;
struct vm_area_struct;
struct rb_node {
   unsigned long rb_parent_color ;
   struct rb_node *rb_right ;
   struct rb_node *rb_left ;
} __attribute__((__aligned__(sizeof(long )))) ;
struct rb_root {
   struct rb_node *rb_node ;
};
struct prio_tree_node;
struct raw_prio_tree_node {
   struct prio_tree_node *left ;
   struct prio_tree_node *right ;
   struct prio_tree_node *parent ;
};
struct prio_tree_node {
   struct prio_tree_node *left ;
   struct prio_tree_node *right ;
   struct prio_tree_node *parent ;
   unsigned long start ;
   unsigned long last ;
};
struct prio_tree_root {
   struct prio_tree_node *prio_tree_node ;
   unsigned short index_bits ;
   unsigned short raw ;
};
struct task_struct;
struct task_struct;
struct address_space;
struct address_space;
union __anonunion____missing_field_name_141 {
   unsigned long index ;
   void *freelist ;
};
struct __anonstruct____missing_field_name_145 {
   unsigned int inuse : 16 ;
   unsigned int objects : 15 ;
   unsigned int frozen : 1 ;
};
union __anonunion____missing_field_name_144 {
   atomic_t _mapcount ;
   struct __anonstruct____missing_field_name_145 __annonCompField31 ;
};
struct __anonstruct____missing_field_name_143 {
   union __anonunion____missing_field_name_144 __annonCompField32 ;
   atomic_t _count ;
};
union __anonunion____missing_field_name_142 {
   unsigned long counters ;
   struct __anonstruct____missing_field_name_143 __annonCompField33 ;
};
struct __anonstruct____missing_field_name_140 {
   union __anonunion____missing_field_name_141 __annonCompField30 ;
   union __anonunion____missing_field_name_142 __annonCompField34 ;
};
struct __anonstruct____missing_field_name_147 {
   struct page *next ;
   int pages ;
   int pobjects ;
};
union __anonunion____missing_field_name_146 {
   struct list_head lru ;
   struct __anonstruct____missing_field_name_147 __annonCompField36 ;
};
union __anonunion____missing_field_name_148 {
   unsigned long private ;
   struct kmem_cache *slab ;
   struct page *first_page ;
};
struct page {
   unsigned long flags ;
   struct address_space *mapping ;
   struct __anonstruct____missing_field_name_140 __annonCompField35 ;
   union __anonunion____missing_field_name_146 __annonCompField37 ;
   union __anonunion____missing_field_name_148 __annonCompField38 ;
   unsigned long debug_flags ;
} __attribute__((__aligned__((2) * (sizeof(unsigned long )) ))) ;
struct __anonstruct_vm_set_150 {
   struct list_head list ;
   void *parent ;
   struct vm_area_struct *head ;
};
union __anonunion_shared_149 {
   struct __anonstruct_vm_set_150 vm_set ;
   struct raw_prio_tree_node prio_tree_node ;
};
struct anon_vma;
struct vm_operations_struct;
struct mempolicy;
struct vm_area_struct {
   struct mm_struct *vm_mm ;
   unsigned long vm_start ;
   unsigned long vm_end ;
   struct vm_area_struct *vm_next ;
   struct vm_area_struct *vm_prev ;
   pgprot_t vm_page_prot ;
   unsigned long vm_flags ;
   struct rb_node vm_rb ;
   union __anonunion_shared_149 shared ;
   struct list_head anon_vma_chain ;
   struct anon_vma *anon_vma ;
   struct vm_operations_struct const *vm_ops ;
   unsigned long vm_pgoff ;
   struct file *vm_file ;
   void *vm_private_data ;
   struct mempolicy *vm_policy ;
};
struct core_thread {
   struct task_struct *task ;
   struct core_thread *next ;
};
struct core_state {
   atomic_t nr_threads ;
   struct core_thread dumper ;
   struct completion startup ;
};
struct mm_rss_stat {
   atomic_long_t count[3] ;
};
struct linux_binfmt;
struct mmu_notifier_mm;
struct mm_struct {
   struct vm_area_struct *mmap ;
   struct rb_root mm_rb ;
   struct vm_area_struct *mmap_cache ;
   unsigned long (*get_unmapped_area)(struct file *filp , unsigned long addr , unsigned long len ,
                                      unsigned long pgoff , unsigned long flags ) ;
   void (*unmap_area)(struct mm_struct *mm , unsigned long addr ) ;
   unsigned long mmap_base ;
   unsigned long task_size ;
   unsigned long cached_hole_size ;
   unsigned long free_area_cache ;
   pgd_t *pgd ;
   atomic_t mm_users ;
   atomic_t mm_count ;
   int map_count ;
   spinlock_t page_table_lock ;
   struct rw_semaphore mmap_sem ;
   struct list_head mmlist ;
   unsigned long hiwater_rss ;
   unsigned long hiwater_vm ;
   unsigned long total_vm ;
   unsigned long locked_vm ;
   unsigned long pinned_vm ;
   unsigned long shared_vm ;
   unsigned long exec_vm ;
   unsigned long stack_vm ;
   unsigned long reserved_vm ;
   unsigned long def_flags ;
   unsigned long nr_ptes ;
   unsigned long start_code ;
   unsigned long end_code ;
   unsigned long start_data ;
   unsigned long end_data ;
   unsigned long start_brk ;
   unsigned long brk ;
   unsigned long start_stack ;
   unsigned long arg_start ;
   unsigned long arg_end ;
   unsigned long env_start ;
   unsigned long env_end ;
   unsigned long saved_auxv[44] ;
   struct mm_rss_stat rss_stat ;
   struct linux_binfmt *binfmt ;
   cpumask_var_t cpu_vm_mask_var ;
   mm_context_t context ;
   unsigned int faultstamp ;
   unsigned int token_priority ;
   unsigned int last_interval ;
   unsigned long flags ;
   struct core_state *core_state ;
   spinlock_t ioctx_lock ;
   struct hlist_head ioctx_list ;
   struct task_struct *owner ;
   struct file *exe_file ;
   unsigned long num_exe_file_vmas ;
   struct mmu_notifier_mm *mmu_notifier_mm ;
   pgtable_t pmd_huge_pte ;
   struct cpumask cpumask_allocation ;
};
struct shrink_control {
   gfp_t gfp_mask ;
   unsigned long nr_to_scan ;
};
struct shrinker {
   int (*shrink)(struct shrinker * , struct shrink_control *sc ) ;
   int seeks ;
   long batch ;
   struct list_head list ;
   atomic_long_t nr_in_batch ;
};
struct mempolicy;
struct anon_vma;
struct file_ra_state;
struct file_ra_state;
struct user_struct;
struct user_struct;
struct writeback_control;
struct writeback_control;
struct mm_struct;
struct vm_area_struct;
struct vm_fault {
   unsigned int flags ;
   unsigned long pgoff ;
   void *virtual_address ;
   struct page *page ;
};
struct vm_operations_struct {
   void (*open)(struct vm_area_struct *area ) ;
   void (*close)(struct vm_area_struct *area ) ;
   int (*fault)(struct vm_area_struct *vma , struct vm_fault *vmf ) ;
   int (*page_mkwrite)(struct vm_area_struct *vma , struct vm_fault *vmf ) ;
   int (*access)(struct vm_area_struct *vma , unsigned long addr , void *buf , int len ,
                 int write ) ;
   int (*set_policy)(struct vm_area_struct *vma , struct mempolicy *new ) ;
   struct mempolicy *(*get_policy)(struct vm_area_struct *vma , unsigned long addr ) ;
   int (*migrate)(struct vm_area_struct *vma , nodemask_t const *from , nodemask_t const *to ,
                  unsigned long flags ) ;
};
struct inode;
struct inode;
struct page;
struct scatterlist {
   unsigned long sg_magic ;
   unsigned long page_link ;
   unsigned int offset ;
   unsigned int length ;
   dma_addr_t dma_address ;
   unsigned int dma_length ;
};
struct dma_map_ops {
   void *(*alloc)(struct device *dev , size_t size , dma_addr_t *dma_handle , gfp_t gfp ,
                  struct dma_attrs *attrs ) ;
   void (*free)(struct device *dev , size_t size , void *vaddr , dma_addr_t dma_handle ,
                struct dma_attrs *attrs ) ;
   int (*mmap)(struct device * , struct vm_area_struct * , void * , dma_addr_t ,
               size_t , struct dma_attrs *attrs ) ;
   dma_addr_t (*map_page)(struct device *dev , struct page *page , unsigned long offset ,
                          size_t size , enum dma_data_direction dir , struct dma_attrs *attrs ) ;
   void (*unmap_page)(struct device *dev , dma_addr_t dma_handle , size_t size , enum dma_data_direction dir ,
                      struct dma_attrs *attrs ) ;
   int (*map_sg)(struct device *dev , struct scatterlist *sg , int nents , enum dma_data_direction dir ,
                 struct dma_attrs *attrs ) ;
   void (*unmap_sg)(struct device *dev , struct scatterlist *sg , int nents , enum dma_data_direction dir ,
                    struct dma_attrs *attrs ) ;
   void (*sync_single_for_cpu)(struct device *dev , dma_addr_t dma_handle , size_t size ,
                               enum dma_data_direction dir ) ;
   void (*sync_single_for_device)(struct device *dev , dma_addr_t dma_handle , size_t size ,
                                  enum dma_data_direction dir ) ;
   void (*sync_sg_for_cpu)(struct device *dev , struct scatterlist *sg , int nents ,
                           enum dma_data_direction dir ) ;
   void (*sync_sg_for_device)(struct device *dev , struct scatterlist *sg , int nents ,
                              enum dma_data_direction dir ) ;
   int (*mapping_error)(struct device *dev , dma_addr_t dma_addr ) ;
   int (*dma_supported)(struct device *dev , u64 mask ) ;
   int (*set_dma_mask)(struct device *dev , u64 mask ) ;
   int is_phys ;
};
struct device;
struct scatterlist;
struct bus_type;
struct device;
struct dma_attrs;
struct scatterlist;
struct dma_pool;
struct page;
struct block_device;
struct block_device;
struct hlist_bl_node;
struct hlist_bl_head {
   struct hlist_bl_node *first ;
};
struct hlist_bl_node {
   struct hlist_bl_node *next ;
   struct hlist_bl_node **pprev ;
};
struct nameidata;
struct nameidata;
struct path;
struct path;
struct vfsmount;
struct vfsmount;
struct qstr {
   unsigned int hash ;
   unsigned int len ;
   unsigned char const *name ;
};
struct dentry_operations;
struct super_block;
union __anonunion_d_u_152 {
   struct list_head d_child ;
   struct rcu_head d_rcu ;
};
struct dentry {
   unsigned int d_flags ;
   seqcount_t d_seq ;
   struct hlist_bl_node d_hash ;
   struct dentry *d_parent ;
   struct qstr d_name ;
   struct inode *d_inode ;
   unsigned char d_iname[32] ;
   unsigned int d_count ;
   spinlock_t d_lock ;
   struct dentry_operations const *d_op ;
   struct super_block *d_sb ;
   unsigned long d_time ;
   void *d_fsdata ;
   struct list_head d_lru ;
   union __anonunion_d_u_152 d_u ;
   struct list_head d_subdirs ;
   struct list_head d_alias ;
};
struct dentry_operations {
   int (*d_revalidate)(struct dentry * , struct nameidata * ) ;
   int (*d_hash)(struct dentry const * , struct inode const * , struct qstr * ) ;
   int (*d_compare)(struct dentry const * , struct inode const * , struct dentry const * ,
                    struct inode const * , unsigned int , char const * , struct qstr const * ) ;
   int (*d_delete)(struct dentry const * ) ;
   void (*d_release)(struct dentry * ) ;
   void (*d_prune)(struct dentry * ) ;
   void (*d_iput)(struct dentry * , struct inode * ) ;
   char *(*d_dname)(struct dentry * , char * , int ) ;
   struct vfsmount *(*d_automount)(struct path * ) ;
   int (*d_manage)(struct dentry * , bool ) ;
} __attribute__((__aligned__((1) << (6) ))) ;
struct dentry;
struct vfsmount;
struct path {
   struct vfsmount *mnt ;
   struct dentry *dentry ;
};
struct kstat {
   u64 ino ;
   dev_t dev ;
   umode_t mode ;
   unsigned int nlink ;
   uid_t uid ;
   gid_t gid ;
   dev_t rdev ;
   loff_t size ;
   struct timespec atime ;
   struct timespec mtime ;
   struct timespec ctime ;
   unsigned long blksize ;
   unsigned long long blocks ;
};
struct radix_tree_node;
struct radix_tree_root {
   unsigned int height ;
   gfp_t gfp_mask ;
   struct radix_tree_node *rnode ;
};
enum pid_type {
    PIDTYPE_PID = 0,
    PIDTYPE_PGID = 1,
    PIDTYPE_SID = 2,
    PIDTYPE_MAX = 3
} ;
struct pid_namespace;
struct upid {
   int nr ;
   struct pid_namespace *ns ;
   struct hlist_node pid_chain ;
};
struct pid {
   atomic_t count ;
   unsigned int level ;
   struct hlist_head tasks[3] ;
   struct rcu_head rcu ;
   struct upid numbers[1] ;
};
struct pid_link {
   struct hlist_node node ;
   struct pid *pid ;
};
struct pid_namespace;
struct task_struct;
struct kernel_cap_struct {
   __u32 cap[2] ;
};
typedef struct kernel_cap_struct kernel_cap_t;
struct dentry;
struct user_namespace;
struct user_namespace;
struct fiemap_extent {
   __u64 fe_logical ;
   __u64 fe_physical ;
   __u64 fe_length ;
   __u64 fe_reserved64[2] ;
   __u32 fe_flags ;
   __u32 fe_reserved[3] ;
};
enum migrate_mode {
    MIGRATE_ASYNC = 0,
    MIGRATE_SYNC_LIGHT = 1,
    MIGRATE_SYNC = 2
} ;
struct export_operations;
struct export_operations;
struct iovec;
struct iovec;
struct nameidata;
struct kiocb;
struct kiocb;
struct kobject;
struct pipe_inode_info;
struct pipe_inode_info;
struct poll_table_struct;
struct poll_table_struct;
struct kstatfs;
struct kstatfs;
struct vm_area_struct;
struct vfsmount;
struct cred;
struct cred;
struct iattr {
   unsigned int ia_valid ;
   umode_t ia_mode ;
   uid_t ia_uid ;
   gid_t ia_gid ;
   loff_t ia_size ;
   struct timespec ia_atime ;
   struct timespec ia_mtime ;
   struct timespec ia_ctime ;
   struct file *ia_file ;
};
struct if_dqinfo {
   __u64 dqi_bgrace ;
   __u64 dqi_igrace ;
   __u32 dqi_flags ;
   __u32 dqi_valid ;
};
struct fs_disk_quota {
   __s8 d_version ;
   __s8 d_flags ;
   __u16 d_fieldmask ;
   __u32 d_id ;
   __u64 d_blk_hardlimit ;
   __u64 d_blk_softlimit ;
   __u64 d_ino_hardlimit ;
   __u64 d_ino_softlimit ;
   __u64 d_bcount ;
   __u64 d_icount ;
   __s32 d_itimer ;
   __s32 d_btimer ;
   __u16 d_iwarns ;
   __u16 d_bwarns ;
   __s32 d_padding2 ;
   __u64 d_rtb_hardlimit ;
   __u64 d_rtb_softlimit ;
   __u64 d_rtbcount ;
   __s32 d_rtbtimer ;
   __u16 d_rtbwarns ;
   __s16 d_padding3 ;
   char d_padding4[8] ;
};
struct fs_qfilestat {
   __u64 qfs_ino ;
   __u64 qfs_nblks ;
   __u32 qfs_nextents ;
};
typedef struct fs_qfilestat fs_qfilestat_t;
struct fs_quota_stat {
   __s8 qs_version ;
   __u16 qs_flags ;
   __s8 qs_pad ;
   fs_qfilestat_t qs_uquota ;
   fs_qfilestat_t qs_gquota ;
   __u32 qs_incoredqs ;
   __s32 qs_btimelimit ;
   __s32 qs_itimelimit ;
   __s32 qs_rtbtimelimit ;
   __u16 qs_bwarnlimit ;
   __u16 qs_iwarnlimit ;
};
struct dquot;
struct dquot;
typedef __kernel_uid32_t qid_t;
typedef long long qsize_t;
struct mem_dqblk {
   qsize_t dqb_bhardlimit ;
   qsize_t dqb_bsoftlimit ;
   qsize_t dqb_curspace ;
   qsize_t dqb_rsvspace ;
   qsize_t dqb_ihardlimit ;
   qsize_t dqb_isoftlimit ;
   qsize_t dqb_curinodes ;
   time_t dqb_btime ;
   time_t dqb_itime ;
};
struct quota_format_type;
struct quota_format_type;
struct mem_dqinfo {
   struct quota_format_type *dqi_format ;
   int dqi_fmt_id ;
   struct list_head dqi_dirty_list ;
   unsigned long dqi_flags ;
   unsigned int dqi_bgrace ;
   unsigned int dqi_igrace ;
   qsize_t dqi_maxblimit ;
   qsize_t dqi_maxilimit ;
   void *dqi_priv ;
};
struct super_block;
struct dquot {
   struct hlist_node dq_hash ;
   struct list_head dq_inuse ;
   struct list_head dq_free ;
   struct list_head dq_dirty ;
   struct mutex dq_lock ;
   atomic_t dq_count ;
   wait_queue_head_t dq_wait_unused ;
   struct super_block *dq_sb ;
   unsigned int dq_id ;
   loff_t dq_off ;
   unsigned long dq_flags ;
   short dq_type ;
   struct mem_dqblk dq_dqb ;
};
struct quota_format_ops {
   int (*check_quota_file)(struct super_block *sb , int type ) ;
   int (*read_file_info)(struct super_block *sb , int type ) ;
   int (*write_file_info)(struct super_block *sb , int type ) ;
   int (*free_file_info)(struct super_block *sb , int type ) ;
   int (*read_dqblk)(struct dquot *dquot ) ;
   int (*commit_dqblk)(struct dquot *dquot ) ;
   int (*release_dqblk)(struct dquot *dquot ) ;
};
struct dquot_operations {
   int (*write_dquot)(struct dquot * ) ;
   struct dquot *(*alloc_dquot)(struct super_block * , int ) ;
   void (*destroy_dquot)(struct dquot * ) ;
   int (*acquire_dquot)(struct dquot * ) ;
   int (*release_dquot)(struct dquot * ) ;
   int (*mark_dirty)(struct dquot * ) ;
   int (*write_info)(struct super_block * , int ) ;
   qsize_t *(*get_reserved_space)(struct inode * ) ;
};
struct path;
struct quotactl_ops {
   int (*quota_on)(struct super_block * , int , int , struct path * ) ;
   int (*quota_on_meta)(struct super_block * , int , int ) ;
   int (*quota_off)(struct super_block * , int ) ;
   int (*quota_sync)(struct super_block * , int , int ) ;
   int (*get_info)(struct super_block * , int , struct if_dqinfo * ) ;
   int (*set_info)(struct super_block * , int , struct if_dqinfo * ) ;
   int (*get_dqblk)(struct super_block * , int , qid_t , struct fs_disk_quota * ) ;
   int (*set_dqblk)(struct super_block * , int , qid_t , struct fs_disk_quota * ) ;
   int (*get_xstate)(struct super_block * , struct fs_quota_stat * ) ;
   int (*set_xstate)(struct super_block * , unsigned int , int ) ;
};
struct quota_format_type {
   int qf_fmt_id ;
   struct quota_format_ops const *qf_ops ;
   struct module *qf_owner ;
   struct quota_format_type *qf_next ;
};
struct quota_info {
   unsigned int flags ;
   struct mutex dqio_mutex ;
   struct mutex dqonoff_mutex ;
   struct rw_semaphore dqptr_sem ;
   struct inode *files[2] ;
   struct mem_dqinfo info[2] ;
   struct quota_format_ops const *ops[2] ;
};
struct page;
struct address_space;
struct writeback_control;
union __anonunion_arg_160 {
   char *buf ;
   void *data ;
};
struct __anonstruct_read_descriptor_t_159 {
   size_t written ;
   size_t count ;
   union __anonunion_arg_160 arg ;
   int error ;
};
typedef struct __anonstruct_read_descriptor_t_159 read_descriptor_t;
struct address_space_operations {
   int (*writepage)(struct page *page , struct writeback_control *wbc ) ;
   int (*readpage)(struct file * , struct page * ) ;
   int (*writepages)(struct address_space * , struct writeback_control * ) ;
   int (*set_page_dirty)(struct page *page ) ;
   int (*readpages)(struct file *filp , struct address_space *mapping , struct list_head *pages ,
                    unsigned int nr_pages ) ;
   int (*write_begin)(struct file * , struct address_space *mapping , loff_t pos ,
                      unsigned int len , unsigned int flags , struct page **pagep ,
                      void **fsdata ) ;
   int (*write_end)(struct file * , struct address_space *mapping , loff_t pos , unsigned int len ,
                    unsigned int copied , struct page *page , void *fsdata ) ;
   sector_t (*bmap)(struct address_space * , sector_t ) ;
   void (*invalidatepage)(struct page * , unsigned long ) ;
   int (*releasepage)(struct page * , gfp_t ) ;
   void (*freepage)(struct page * ) ;
   ssize_t (*direct_IO)(int , struct kiocb * , struct iovec const *iov , loff_t offset ,
                        unsigned long nr_segs ) ;
   int (*get_xip_mem)(struct address_space * , unsigned long , int , void ** , unsigned long * ) ;
   int (*migratepage)(struct address_space * , struct page * , struct page * , enum migrate_mode ) ;
   int (*launder_page)(struct page * ) ;
   int (*is_partially_uptodate)(struct page * , read_descriptor_t * , unsigned long ) ;
   int (*error_remove_page)(struct address_space * , struct page * ) ;
};
struct backing_dev_info;
struct backing_dev_info;
struct address_space {
   struct inode *host ;
   struct radix_tree_root page_tree ;
   spinlock_t tree_lock ;
   unsigned int i_mmap_writable ;
   struct prio_tree_root i_mmap ;
   struct list_head i_mmap_nonlinear ;
   struct mutex i_mmap_mutex ;
   unsigned long nrpages ;
   unsigned long writeback_index ;
   struct address_space_operations const *a_ops ;
   unsigned long flags ;
   struct backing_dev_info *backing_dev_info ;
   spinlock_t private_lock ;
   struct list_head private_list ;
   struct address_space *assoc_mapping ;
} __attribute__((__aligned__(sizeof(long )))) ;
struct request_queue;
struct request_queue;
struct hd_struct;
struct gendisk;
struct block_device {
   dev_t bd_dev ;
   int bd_openers ;
   struct inode *bd_inode ;
   struct super_block *bd_super ;
   struct mutex bd_mutex ;
   struct list_head bd_inodes ;
   void *bd_claiming ;
   void *bd_holder ;
   int bd_holders ;
   bool bd_write_holder ;
   struct list_head bd_holder_disks ;
   struct block_device *bd_contains ;
   unsigned int bd_block_size ;
   struct hd_struct *bd_part ;
   unsigned int bd_part_count ;
   int bd_invalidated ;
   struct gendisk *bd_disk ;
   struct request_queue *bd_queue ;
   struct list_head bd_list ;
   unsigned long bd_private ;
   int bd_fsfreeze_count ;
   struct mutex bd_fsfreeze_mutex ;
};
struct posix_acl;
struct posix_acl;
struct inode_operations;
union __anonunion____missing_field_name_161 {
   unsigned int const i_nlink ;
   unsigned int __i_nlink ;
};
union __anonunion____missing_field_name_162 {
   struct list_head i_dentry ;
   struct rcu_head i_rcu ;
};
struct file_operations;
struct file_lock;
struct cdev;
union __anonunion____missing_field_name_163 {
   struct pipe_inode_info *i_pipe ;
   struct block_device *i_bdev ;
   struct cdev *i_cdev ;
};
struct inode {
   umode_t i_mode ;
   unsigned short i_opflags ;
   uid_t i_uid ;
   gid_t i_gid ;
   unsigned int i_flags ;
   struct posix_acl *i_acl ;
   struct posix_acl *i_default_acl ;
   struct inode_operations const *i_op ;
   struct super_block *i_sb ;
   struct address_space *i_mapping ;
   void *i_security ;
   unsigned long i_ino ;
   union __anonunion____missing_field_name_161 __annonCompField39 ;
   dev_t i_rdev ;
   struct timespec i_atime ;
   struct timespec i_mtime ;
   struct timespec i_ctime ;
   spinlock_t i_lock ;
   unsigned short i_bytes ;
   blkcnt_t i_blocks ;
   loff_t i_size ;
   unsigned long i_state ;
   struct mutex i_mutex ;
   unsigned long dirtied_when ;
   struct hlist_node i_hash ;
   struct list_head i_wb_list ;
   struct list_head i_lru ;
   struct list_head i_sb_list ;
   union __anonunion____missing_field_name_162 __annonCompField40 ;
   atomic_t i_count ;
   unsigned int i_blkbits ;
   u64 i_version ;
   atomic_t i_dio_count ;
   atomic_t i_writecount ;
   struct file_operations const *i_fop ;
   struct file_lock *i_flock ;
   struct address_space i_data ;
   struct dquot *i_dquot[2] ;
   struct list_head i_devices ;
   union __anonunion____missing_field_name_163 __annonCompField41 ;
   __u32 i_generation ;
   __u32 i_fsnotify_mask ;
   struct hlist_head i_fsnotify_marks ;
   atomic_t i_readcount ;
   void *i_private ;
};
struct fown_struct {
   rwlock_t lock ;
   struct pid *pid ;
   enum pid_type pid_type ;
   uid_t uid ;
   uid_t euid ;
   int signum ;
};
struct file_ra_state {
   unsigned long start ;
   unsigned int size ;
   unsigned int async_size ;
   unsigned int ra_pages ;
   unsigned int mmap_miss ;
   loff_t prev_pos ;
};
union __anonunion_f_u_164 {
   struct list_head fu_list ;
   struct rcu_head fu_rcuhead ;
};
struct file {
   union __anonunion_f_u_164 f_u ;
   struct path f_path ;
   struct file_operations const *f_op ;
   spinlock_t f_lock ;
   int f_sb_list_cpu ;
   atomic_long_t f_count ;
   unsigned int f_flags ;
   fmode_t f_mode ;
   loff_t f_pos ;
   struct fown_struct f_owner ;
   struct cred const *f_cred ;
   struct file_ra_state f_ra ;
   u64 f_version ;
   void *f_security ;
   void *private_data ;
   struct list_head f_ep_links ;
   struct list_head f_tfile_llink ;
   struct address_space *f_mapping ;
   unsigned long f_mnt_write_state ;
};
struct files_struct;
typedef struct files_struct *fl_owner_t;
struct file_lock_operations {
   void (*fl_copy_lock)(struct file_lock * , struct file_lock * ) ;
   void (*fl_release_private)(struct file_lock * ) ;
};
struct lock_manager_operations {
   int (*lm_compare_owner)(struct file_lock * , struct file_lock * ) ;
   void (*lm_notify)(struct file_lock * ) ;
   int (*lm_grant)(struct file_lock * , struct file_lock * , int ) ;
   void (*lm_release_private)(struct file_lock * ) ;
   void (*lm_break)(struct file_lock * ) ;
   int (*lm_change)(struct file_lock ** , int ) ;
};
struct nlm_lockowner;
struct nlm_lockowner;
struct nfs_lock_info {
   u32 state ;
   struct nlm_lockowner *owner ;
   struct list_head list ;
};
struct nfs4_lock_state;
struct nfs4_lock_state;
struct nfs4_lock_info {
   struct nfs4_lock_state *owner ;
};
struct fasync_struct;
struct __anonstruct_afs_166 {
   struct list_head link ;
   int state ;
};
union __anonunion_fl_u_165 {
   struct nfs_lock_info nfs_fl ;
   struct nfs4_lock_info nfs4_fl ;
   struct __anonstruct_afs_166 afs ;
};
struct file_lock {
   struct file_lock *fl_next ;
   struct list_head fl_link ;
   struct list_head fl_block ;
   fl_owner_t fl_owner ;
   unsigned int fl_flags ;
   unsigned char fl_type ;
   unsigned int fl_pid ;
   struct pid *fl_nspid ;
   wait_queue_head_t fl_wait ;
   struct file *fl_file ;
   loff_t fl_start ;
   loff_t fl_end ;
   struct fasync_struct *fl_fasync ;
   unsigned long fl_break_time ;
   unsigned long fl_downgrade_time ;
   struct file_lock_operations const *fl_ops ;
   struct lock_manager_operations const *fl_lmops ;
   union __anonunion_fl_u_165 fl_u ;
};
struct fasync_struct {
   spinlock_t fa_lock ;
   int magic ;
   int fa_fd ;
   struct fasync_struct *fa_next ;
   struct file *fa_file ;
   struct rcu_head fa_rcu ;
};
struct file_system_type;
struct super_operations;
struct xattr_handler;
struct mtd_info;
struct super_block {
   struct list_head s_list ;
   dev_t s_dev ;
   unsigned char s_dirt ;
   unsigned char s_blocksize_bits ;
   unsigned long s_blocksize ;
   loff_t s_maxbytes ;
   struct file_system_type *s_type ;
   struct super_operations const *s_op ;
   struct dquot_operations const *dq_op ;
   struct quotactl_ops const *s_qcop ;
   struct export_operations const *s_export_op ;
   unsigned long s_flags ;
   unsigned long s_magic ;
   struct dentry *s_root ;
   struct rw_semaphore s_umount ;
   struct mutex s_lock ;
   int s_count ;
   atomic_t s_active ;
   void *s_security ;
   struct xattr_handler const **s_xattr ;
   struct list_head s_inodes ;
   struct hlist_bl_head s_anon ;
   struct list_head *s_files ;
   struct list_head s_mounts ;
   struct list_head s_dentry_lru ;
   int s_nr_dentry_unused ;
   spinlock_t s_inode_lru_lock __attribute__((__aligned__((1) << (6) ))) ;
   struct list_head s_inode_lru ;
   int s_nr_inodes_unused ;
   struct block_device *s_bdev ;
   struct backing_dev_info *s_bdi ;
   struct mtd_info *s_mtd ;
   struct hlist_node s_instances ;
   struct quota_info s_dquot ;
   int s_frozen ;
   wait_queue_head_t s_wait_unfrozen ;
   char s_id[32] ;
   u8 s_uuid[16] ;
   void *s_fs_info ;
   unsigned int s_max_links ;
   fmode_t s_mode ;
   u32 s_time_gran ;
   struct mutex s_vfs_rename_mutex ;
   char *s_subtype ;
   char *s_options ;
   struct dentry_operations const *s_d_op ;
   int cleancache_poolid ;
   struct shrinker s_shrink ;
   atomic_long_t s_remove_count ;
   int s_readonly_remount ;
};
struct fiemap_extent_info {
   unsigned int fi_flags ;
   unsigned int fi_extents_mapped ;
   unsigned int fi_extents_max ;
   struct fiemap_extent *fi_extents_start ;
};
struct file_operations {
   struct module *owner ;
   loff_t (*llseek)(struct file * , loff_t , int ) ;
   ssize_t (*read)(struct file * , char * , size_t , loff_t * ) ;
   ssize_t (*write)(struct file * , char const * , size_t , loff_t * ) ;
   ssize_t (*aio_read)(struct kiocb * , struct iovec const * , unsigned long ,
                       loff_t ) ;
   ssize_t (*aio_write)(struct kiocb * , struct iovec const * , unsigned long ,
                        loff_t ) ;
   int (*readdir)(struct file * , void * , int (*)(void * , char const * , int ,
                                                   loff_t , u64 , unsigned int ) ) ;
   unsigned int (*poll)(struct file * , struct poll_table_struct * ) ;
   long (*unlocked_ioctl)(struct file * , unsigned int , unsigned long ) ;
   long (*compat_ioctl)(struct file * , unsigned int , unsigned long ) ;
   int (*mmap)(struct file * , struct vm_area_struct * ) ;
   int (*open)(struct inode * , struct file * ) ;
   int (*flush)(struct file * , fl_owner_t id ) ;
   int (*release)(struct inode * , struct file * ) ;
   int (*fsync)(struct file * , loff_t , loff_t , int datasync ) ;
   int (*aio_fsync)(struct kiocb * , int datasync ) ;
   int (*fasync)(int , struct file * , int ) ;
   int (*lock)(struct file * , int , struct file_lock * ) ;
   ssize_t (*sendpage)(struct file * , struct page * , int , size_t , loff_t * ,
                       int ) ;
   unsigned long (*get_unmapped_area)(struct file * , unsigned long , unsigned long ,
                                      unsigned long , unsigned long ) ;
   int (*check_flags)(int ) ;
   int (*flock)(struct file * , int , struct file_lock * ) ;
   ssize_t (*splice_write)(struct pipe_inode_info * , struct file * , loff_t * , size_t ,
                           unsigned int ) ;
   ssize_t (*splice_read)(struct file * , loff_t * , struct pipe_inode_info * , size_t ,
                          unsigned int ) ;
   int (*setlease)(struct file * , long , struct file_lock ** ) ;
   long (*fallocate)(struct file *file , int mode , loff_t offset , loff_t len ) ;
};
struct inode_operations {
   struct dentry *(*lookup)(struct inode * , struct dentry * , struct nameidata * ) ;
   void *(*follow_link)(struct dentry * , struct nameidata * ) ;
   int (*permission)(struct inode * , int ) ;
   struct posix_acl *(*get_acl)(struct inode * , int ) ;
   int (*readlink)(struct dentry * , char * , int ) ;
   void (*put_link)(struct dentry * , struct nameidata * , void * ) ;
   int (*create)(struct inode * , struct dentry * , umode_t , struct nameidata * ) ;
   int (*link)(struct dentry * , struct inode * , struct dentry * ) ;
   int (*unlink)(struct inode * , struct dentry * ) ;
   int (*symlink)(struct inode * , struct dentry * , char const * ) ;
   int (*mkdir)(struct inode * , struct dentry * , umode_t ) ;
   int (*rmdir)(struct inode * , struct dentry * ) ;
   int (*mknod)(struct inode * , struct dentry * , umode_t , dev_t ) ;
   int (*rename)(struct inode * , struct dentry * , struct inode * , struct dentry * ) ;
   void (*truncate)(struct inode * ) ;
   int (*setattr)(struct dentry * , struct iattr * ) ;
   int (*getattr)(struct vfsmount *mnt , struct dentry * , struct kstat * ) ;
   int (*setxattr)(struct dentry * , char const * , void const * , size_t , int ) ;
   ssize_t (*getxattr)(struct dentry * , char const * , void * , size_t ) ;
   ssize_t (*listxattr)(struct dentry * , char * , size_t ) ;
   int (*removexattr)(struct dentry * , char const * ) ;
   void (*truncate_range)(struct inode * , loff_t , loff_t ) ;
   int (*fiemap)(struct inode * , struct fiemap_extent_info * , u64 start , u64 len ) ;
} __attribute__((__aligned__((1) << (6) ))) ;
struct seq_file;
struct super_operations {
   struct inode *(*alloc_inode)(struct super_block *sb ) ;
   void (*destroy_inode)(struct inode * ) ;
   void (*dirty_inode)(struct inode * , int flags ) ;
   int (*write_inode)(struct inode * , struct writeback_control *wbc ) ;
   int (*drop_inode)(struct inode * ) ;
   void (*evict_inode)(struct inode * ) ;
   void (*put_super)(struct super_block * ) ;
   void (*write_super)(struct super_block * ) ;
   int (*sync_fs)(struct super_block *sb , int wait ) ;
   int (*freeze_fs)(struct super_block * ) ;
   int (*unfreeze_fs)(struct super_block * ) ;
   int (*statfs)(struct dentry * , struct kstatfs * ) ;
   int (*remount_fs)(struct super_block * , int * , char * ) ;
   void (*umount_begin)(struct super_block * ) ;
   int (*show_options)(struct seq_file * , struct dentry * ) ;
   int (*show_devname)(struct seq_file * , struct dentry * ) ;
   int (*show_path)(struct seq_file * , struct dentry * ) ;
   int (*show_stats)(struct seq_file * , struct dentry * ) ;
   ssize_t (*quota_read)(struct super_block * , int , char * , size_t , loff_t ) ;
   ssize_t (*quota_write)(struct super_block * , int , char const * , size_t ,
                          loff_t ) ;
   int (*bdev_try_to_free_page)(struct super_block * , struct page * , gfp_t ) ;
   int (*nr_cached_objects)(struct super_block * ) ;
   void (*free_cached_objects)(struct super_block * , int ) ;
};
struct file_system_type {
   char const *name ;
   int fs_flags ;
   struct dentry *(*mount)(struct file_system_type * , int , char const * , void * ) ;
   void (*kill_sb)(struct super_block * ) ;
   struct module *owner ;
   struct file_system_type *next ;
   struct hlist_head fs_supers ;
   struct lock_class_key s_lock_key ;
   struct lock_class_key s_umount_key ;
   struct lock_class_key s_vfs_rename_key ;
   struct lock_class_key i_lock_key ;
   struct lock_class_key i_mutex_key ;
   struct lock_class_key i_mutex_dir_key ;
};
struct kmem_cache_cpu {
   void **freelist ;
   unsigned long tid ;
   struct page *page ;
   struct page *partial ;
   int node ;
   unsigned int stat[26] ;
};
struct kmem_cache_node {
   spinlock_t list_lock ;
   unsigned long nr_partial ;
   struct list_head partial ;
   atomic_long_t nr_slabs ;
   atomic_long_t total_objects ;
   struct list_head full ;
};
struct kmem_cache_order_objects {
   unsigned long x ;
};
struct kmem_cache {
   struct kmem_cache_cpu *cpu_slab ;
   unsigned long flags ;
   unsigned long min_partial ;
   int size ;
   int objsize ;
   int offset ;
   int cpu_partial ;
   struct kmem_cache_order_objects oo ;
   struct kmem_cache_order_objects max ;
   struct kmem_cache_order_objects min ;
   gfp_t allocflags ;
   int refcount ;
   void (*ctor)(void * ) ;
   int inuse ;
   int align ;
   int reserved ;
   char const *name ;
   struct list_head list ;
   struct kobject kobj ;
   int remote_node_defrag_ratio ;
   struct kmem_cache_node *node[1 << 10] ;
};
typedef unsigned long cputime_t;
struct task_struct;
struct sem_undo_list;
struct sysv_sem {
   struct sem_undo_list *undo_list ;
};
struct siginfo;
struct siginfo;
struct __anonstruct_sigset_t_169 {
   unsigned long sig[1] ;
};
typedef struct __anonstruct_sigset_t_169 sigset_t;
typedef void __signalfn_t(int );
typedef __signalfn_t *__sighandler_t;
typedef void __restorefn_t(void);
typedef __restorefn_t *__sigrestore_t;
struct sigaction {
   __sighandler_t sa_handler ;
   unsigned long sa_flags ;
   __sigrestore_t sa_restorer ;
   sigset_t sa_mask ;
};
struct k_sigaction {
   struct sigaction sa ;
};
union sigval {
   int sival_int ;
   void *sival_ptr ;
};
typedef union sigval sigval_t;
struct __anonstruct__kill_171 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
};
struct __anonstruct__timer_172 {
   __kernel_timer_t _tid ;
   int _overrun ;
   char _pad[sizeof(__kernel_uid32_t ) - sizeof(int )] ;
   sigval_t _sigval ;
   int _sys_private ;
};
struct __anonstruct__rt_173 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
   sigval_t _sigval ;
};
struct __anonstruct__sigchld_174 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
   int _status ;
   __kernel_clock_t _utime ;
   __kernel_clock_t _stime ;
};
struct __anonstruct__sigfault_175 {
   void *_addr ;
   short _addr_lsb ;
};
struct __anonstruct__sigpoll_176 {
   long _band ;
   int _fd ;
};
union __anonunion__sifields_170 {
   int _pad[(128UL - 4UL * sizeof(int )) / sizeof(int )] ;
   struct __anonstruct__kill_171 _kill ;
   struct __anonstruct__timer_172 _timer ;
   struct __anonstruct__rt_173 _rt ;
   struct __anonstruct__sigchld_174 _sigchld ;
   struct __anonstruct__sigfault_175 _sigfault ;
   struct __anonstruct__sigpoll_176 _sigpoll ;
};
struct siginfo {
   int si_signo ;
   int si_errno ;
   int si_code ;
   union __anonunion__sifields_170 _sifields ;
};
typedef struct siginfo siginfo_t;
struct siginfo;
struct task_struct;
struct sigpending {
   struct list_head list ;
   sigset_t signal ;
};
struct timespec;
struct pt_regs;
struct __anonstruct_seccomp_t_179 {
   int mode ;
};
typedef struct __anonstruct_seccomp_t_179 seccomp_t;
struct plist_head {
   struct list_head node_list ;
};
struct plist_node {
   int prio ;
   struct list_head prio_list ;
   struct list_head node_list ;
};
struct rt_mutex_waiter;
struct rt_mutex_waiter;
struct rlimit {
   unsigned long rlim_cur ;
   unsigned long rlim_max ;
};
struct task_struct;
struct timerqueue_node {
   struct rb_node node ;
   ktime_t expires ;
};
struct timerqueue_head {
   struct rb_root head ;
   struct timerqueue_node *next ;
};
struct hrtimer_clock_base;
struct hrtimer_clock_base;
struct hrtimer_cpu_base;
struct hrtimer_cpu_base;
enum hrtimer_restart {
    HRTIMER_NORESTART = 0,
    HRTIMER_RESTART = 1
} ;
struct hrtimer {
   struct timerqueue_node node ;
   ktime_t _softexpires ;
   enum hrtimer_restart (*function)(struct hrtimer * ) ;
   struct hrtimer_clock_base *base ;
   unsigned long state ;
   int start_pid ;
   void *start_site ;
   char start_comm[16] ;
};
struct hrtimer_clock_base {
   struct hrtimer_cpu_base *cpu_base ;
   int index ;
   clockid_t clockid ;
   struct timerqueue_head active ;
   ktime_t resolution ;
   ktime_t (*get_time)(void) ;
   ktime_t softirq_time ;
   ktime_t offset ;
};
struct hrtimer_cpu_base {
   raw_spinlock_t lock ;
   unsigned long active_bases ;
   ktime_t expires_next ;
   int hres_active ;
   int hang_detected ;
   unsigned long nr_events ;
   unsigned long nr_retries ;
   unsigned long nr_hangs ;
   ktime_t max_hang_time ;
   struct hrtimer_clock_base clock_base[3] ;
};
struct task_io_accounting {
   u64 rchar ;
   u64 wchar ;
   u64 syscr ;
   u64 syscw ;
   u64 read_bytes ;
   u64 write_bytes ;
   u64 cancelled_write_bytes ;
};
struct task_struct;
struct latency_record {
   unsigned long backtrace[12] ;
   unsigned int count ;
   unsigned long time ;
   unsigned long max ;
};
struct completion;
struct nsproxy;
struct nsproxy;
typedef int32_t key_serial_t;
typedef uint32_t key_perm_t;
struct key;
struct key;
struct seq_file;
struct user_struct;
struct signal_struct;
struct signal_struct;
struct cred;
struct key_type;
struct key_type;
struct keyring_list;
struct keyring_list;
struct key_user;
union __anonunion____missing_field_name_236 {
   time_t expiry ;
   time_t revoked_at ;
};
union __anonunion_type_data_237 {
   struct list_head link ;
   unsigned long x[2] ;
   void *p[2] ;
   int reject_error ;
};
union __anonunion_payload_238 {
   unsigned long value ;
   void *rcudata ;
   void *data ;
   struct keyring_list *subscriptions ;
};
struct key {
   atomic_t usage ;
   key_serial_t serial ;
   struct rb_node serial_node ;
   struct key_type *type ;
   struct rw_semaphore sem ;
   struct key_user *user ;
   void *security ;
   union __anonunion____missing_field_name_236 __annonCompField44 ;
   uid_t uid ;
   gid_t gid ;
   key_perm_t perm ;
   unsigned short quotalen ;
   unsigned short datalen ;
   unsigned long flags ;
   char *description ;
   union __anonunion_type_data_237 type_data ;
   union __anonunion_payload_238 payload ;
};
struct audit_context;
struct audit_context;
struct user_struct;
struct cred;
struct inode;
struct group_info {
   atomic_t usage ;
   int ngroups ;
   int nblocks ;
   gid_t small_block[32] ;
   gid_t *blocks[0] ;
};
struct thread_group_cred {
   atomic_t usage ;
   pid_t tgid ;
   spinlock_t lock ;
   struct key *session_keyring ;
   struct key *process_keyring ;
   struct rcu_head rcu ;
};
struct cred {
   atomic_t usage ;
   atomic_t subscribers ;
   void *put_addr ;
   unsigned int magic ;
   uid_t uid ;
   gid_t gid ;
   uid_t suid ;
   gid_t sgid ;
   uid_t euid ;
   gid_t egid ;
   uid_t fsuid ;
   gid_t fsgid ;
   unsigned int securebits ;
   kernel_cap_t cap_inheritable ;
   kernel_cap_t cap_permitted ;
   kernel_cap_t cap_effective ;
   kernel_cap_t cap_bset ;
   unsigned char jit_keyring ;
   struct key *thread_keyring ;
   struct key *request_key_auth ;
   struct thread_group_cred *tgcred ;
   void *security ;
   struct user_struct *user ;
   struct user_namespace *user_ns ;
   struct group_info *group_info ;
   struct rcu_head rcu ;
};
struct llist_node;
struct llist_node {
   struct llist_node *next ;
};
struct futex_pi_state;
struct futex_pi_state;
struct robust_list_head;
struct robust_list_head;
struct bio_list;
struct bio_list;
struct fs_struct;
struct fs_struct;
struct perf_event_context;
struct perf_event_context;
struct blk_plug;
struct blk_plug;
struct seq_file;
struct cfs_rq;
struct cfs_rq;
struct task_struct;
struct nsproxy;
struct user_namespace;
struct io_event {
   __u64 data ;
   __u64 obj ;
   __s64 res ;
   __s64 res2 ;
};
struct iovec {
   void *iov_base ;
   __kernel_size_t iov_len ;
};
struct kioctx;
struct kioctx;
union __anonunion_ki_obj_240 {
   void *user ;
   struct task_struct *tsk ;
};
struct eventfd_ctx;
struct kiocb {
   struct list_head ki_run_list ;
   unsigned long ki_flags ;
   int ki_users ;
   unsigned int ki_key ;
   struct file *ki_filp ;
   struct kioctx *ki_ctx ;
   int (*ki_cancel)(struct kiocb * , struct io_event * ) ;
   ssize_t (*ki_retry)(struct kiocb * ) ;
   void (*ki_dtor)(struct kiocb * ) ;
   union __anonunion_ki_obj_240 ki_obj ;
   __u64 ki_user_data ;
   loff_t ki_pos ;
   void *private ;
   unsigned short ki_opcode ;
   size_t ki_nbytes ;
   char *ki_buf ;
   size_t ki_left ;
   struct iovec ki_inline_vec ;
   struct iovec *ki_iovec ;
   unsigned long ki_nr_segs ;
   unsigned long ki_cur_seg ;
   struct list_head ki_list ;
   struct list_head ki_batch ;
   struct eventfd_ctx *ki_eventfd ;
};
struct aio_ring_info {
   unsigned long mmap_base ;
   unsigned long mmap_size ;
   struct page **ring_pages ;
   spinlock_t ring_lock ;
   long nr_pages ;
   unsigned int nr ;
   unsigned int tail ;
   struct page *internal_pages[8] ;
};
struct kioctx {
   atomic_t users ;
   int dead ;
   struct mm_struct *mm ;
   unsigned long user_id ;
   struct hlist_node list ;
   wait_queue_head_t wait ;
   spinlock_t ctx_lock ;
   int reqs_active ;
   struct list_head active_reqs ;
   struct list_head run_list ;
   unsigned int max_reqs ;
   struct aio_ring_info ring_info ;
   struct delayed_work wq ;
   struct rcu_head rcu_head ;
};
struct mm_struct;
struct sighand_struct {
   atomic_t count ;
   struct k_sigaction action[64] ;
   spinlock_t siglock ;
   wait_queue_head_t signalfd_wqh ;
};
struct pacct_struct {
   int ac_flag ;
   long ac_exitcode ;
   unsigned long ac_mem ;
   cputime_t ac_utime ;
   cputime_t ac_stime ;
   unsigned long ac_minflt ;
   unsigned long ac_majflt ;
};
struct cpu_itimer {
   cputime_t expires ;
   cputime_t incr ;
   u32 error ;
   u32 incr_error ;
};
struct task_cputime {
   cputime_t utime ;
   cputime_t stime ;
   unsigned long long sum_exec_runtime ;
};
struct thread_group_cputimer {
   struct task_cputime cputime ;
   int running ;
   raw_spinlock_t lock ;
};
struct autogroup;
struct autogroup;
struct tty_struct;
struct taskstats;
struct tty_audit_buf;
struct signal_struct {
   atomic_t sigcnt ;
   atomic_t live ;
   int nr_threads ;
   wait_queue_head_t wait_chldexit ;
   struct task_struct *curr_target ;
   struct sigpending shared_pending ;
   int group_exit_code ;
   int notify_count ;
   struct task_struct *group_exit_task ;
   int group_stop_count ;
   unsigned int flags ;
   unsigned int is_child_subreaper : 1 ;
   unsigned int has_child_subreaper : 1 ;
   struct list_head posix_timers ;
   struct hrtimer real_timer ;
   struct pid *leader_pid ;
   ktime_t it_real_incr ;
   struct cpu_itimer it[2] ;
   struct thread_group_cputimer cputimer ;
   struct task_cputime cputime_expires ;
   struct list_head cpu_timers[3] ;
   struct pid *tty_old_pgrp ;
   int leader ;
   struct tty_struct *tty ;
   struct autogroup *autogroup ;
   cputime_t utime ;
   cputime_t stime ;
   cputime_t cutime ;
   cputime_t cstime ;
   cputime_t gtime ;
   cputime_t cgtime ;
   cputime_t prev_utime ;
   cputime_t prev_stime ;
   unsigned long nvcsw ;
   unsigned long nivcsw ;
   unsigned long cnvcsw ;
   unsigned long cnivcsw ;
   unsigned long min_flt ;
   unsigned long maj_flt ;
   unsigned long cmin_flt ;
   unsigned long cmaj_flt ;
   unsigned long inblock ;
   unsigned long oublock ;
   unsigned long cinblock ;
   unsigned long coublock ;
   unsigned long maxrss ;
   unsigned long cmaxrss ;
   struct task_io_accounting ioac ;
   unsigned long long sum_sched_runtime ;
   struct rlimit rlim[16] ;
   struct pacct_struct pacct ;
   struct taskstats *stats ;
   unsigned int audit_tty ;
   struct tty_audit_buf *tty_audit_buf ;
   struct rw_semaphore group_rwsem ;
   int oom_adj ;
   int oom_score_adj ;
   int oom_score_adj_min ;
   struct mutex cred_guard_mutex ;
};
struct user_struct {
   atomic_t __count ;
   atomic_t processes ;
   atomic_t files ;
   atomic_t sigpending ;
   atomic_t inotify_watches ;
   atomic_t inotify_devs ;
   atomic_t fanotify_listeners ;
   atomic_long_t epoll_watches ;
   unsigned long mq_bytes ;
   unsigned long locked_shm ;
   struct key *uid_keyring ;
   struct key *session_keyring ;
   struct hlist_node uidhash_node ;
   uid_t uid ;
   struct user_namespace *user_ns ;
   atomic_long_t locked_vm ;
};
struct backing_dev_info;
struct reclaim_state;
struct reclaim_state;
struct sched_info {
   unsigned long pcount ;
   unsigned long long run_delay ;
   unsigned long long last_arrival ;
   unsigned long long last_queued ;
};
struct task_delay_info {
   spinlock_t lock ;
   unsigned int flags ;
   struct timespec blkio_start ;
   struct timespec blkio_end ;
   u64 blkio_delay ;
   u64 swapin_delay ;
   u32 blkio_count ;
   u32 swapin_count ;
   struct timespec freepages_start ;
   struct timespec freepages_end ;
   u64 freepages_delay ;
   u32 freepages_count ;
};
struct io_context;
struct io_context;
struct audit_context;
struct mempolicy;
struct pipe_inode_info;
struct rq;
struct rq;
struct sched_class {
   struct sched_class const *next ;
   void (*enqueue_task)(struct rq *rq , struct task_struct *p , int flags ) ;
   void (*dequeue_task)(struct rq *rq , struct task_struct *p , int flags ) ;
   void (*yield_task)(struct rq *rq ) ;
   bool (*yield_to_task)(struct rq *rq , struct task_struct *p , bool preempt ) ;
   void (*check_preempt_curr)(struct rq *rq , struct task_struct *p , int flags ) ;
   struct task_struct *(*pick_next_task)(struct rq *rq ) ;
   void (*put_prev_task)(struct rq *rq , struct task_struct *p ) ;
   int (*select_task_rq)(struct task_struct *p , int sd_flag , int flags ) ;
   void (*pre_schedule)(struct rq *this_rq , struct task_struct *task ) ;
   void (*post_schedule)(struct rq *this_rq ) ;
   void (*task_waking)(struct task_struct *task ) ;
   void (*task_woken)(struct rq *this_rq , struct task_struct *task ) ;
   void (*set_cpus_allowed)(struct task_struct *p , struct cpumask const *newmask ) ;
   void (*rq_online)(struct rq *rq ) ;
   void (*rq_offline)(struct rq *rq ) ;
   void (*set_curr_task)(struct rq *rq ) ;
   void (*task_tick)(struct rq *rq , struct task_struct *p , int queued ) ;
   void (*task_fork)(struct task_struct *p ) ;
   void (*switched_from)(struct rq *this_rq , struct task_struct *task ) ;
   void (*switched_to)(struct rq *this_rq , struct task_struct *task ) ;
   void (*prio_changed)(struct rq *this_rq , struct task_struct *task , int oldprio ) ;
   unsigned int (*get_rr_interval)(struct rq *rq , struct task_struct *task ) ;
   void (*task_move_group)(struct task_struct *p , int on_rq ) ;
};
struct load_weight {
   unsigned long weight ;
   unsigned long inv_weight ;
};
struct sched_statistics {
   u64 wait_start ;
   u64 wait_max ;
   u64 wait_count ;
   u64 wait_sum ;
   u64 iowait_count ;
   u64 iowait_sum ;
   u64 sleep_start ;
   u64 sleep_max ;
   s64 sum_sleep_runtime ;
   u64 block_start ;
   u64 block_max ;
   u64 exec_max ;
   u64 slice_max ;
   u64 nr_migrations_cold ;
   u64 nr_failed_migrations_affine ;
   u64 nr_failed_migrations_running ;
   u64 nr_failed_migrations_hot ;
   u64 nr_forced_migrations ;
   u64 nr_wakeups ;
   u64 nr_wakeups_sync ;
   u64 nr_wakeups_migrate ;
   u64 nr_wakeups_local ;
   u64 nr_wakeups_remote ;
   u64 nr_wakeups_affine ;
   u64 nr_wakeups_affine_attempts ;
   u64 nr_wakeups_passive ;
   u64 nr_wakeups_idle ;
};
struct sched_entity {
   struct load_weight load ;
   struct rb_node run_node ;
   struct list_head group_node ;
   unsigned int on_rq ;
   u64 exec_start ;
   u64 sum_exec_runtime ;
   u64 vruntime ;
   u64 prev_sum_exec_runtime ;
   u64 nr_migrations ;
   struct sched_statistics statistics ;
   struct sched_entity *parent ;
   struct cfs_rq *cfs_rq ;
   struct cfs_rq *my_q ;
};
struct rt_rq;
struct sched_rt_entity {
   struct list_head run_list ;
   unsigned long timeout ;
   unsigned int time_slice ;
   int nr_cpus_allowed ;
   struct sched_rt_entity *back ;
   struct sched_rt_entity *parent ;
   struct rt_rq *rt_rq ;
   struct rt_rq *my_q ;
};
struct css_set;
struct compat_robust_list_head;
struct mem_cgroup;
struct memcg_batch_info {
   int do_batch ;
   struct mem_cgroup *memcg ;
   unsigned long nr_pages ;
   unsigned long memsw_nr_pages ;
};
struct task_struct {
   long volatile state ;
   void *stack ;
   atomic_t usage ;
   unsigned int flags ;
   unsigned int ptrace ;
   struct llist_node wake_entry ;
   int on_cpu ;
   int on_rq ;
   int prio ;
   int static_prio ;
   int normal_prio ;
   unsigned int rt_priority ;
   struct sched_class const *sched_class ;
   struct sched_entity se ;
   struct sched_rt_entity rt ;
   struct hlist_head preempt_notifiers ;
   unsigned char fpu_counter ;
   unsigned int policy ;
   cpumask_t cpus_allowed ;
   struct sched_info sched_info ;
   struct list_head tasks ;
   struct plist_node pushable_tasks ;
   struct mm_struct *mm ;
   struct mm_struct *active_mm ;
   unsigned int brk_randomized : 1 ;
   int exit_state ;
   int exit_code ;
   int exit_signal ;
   int pdeath_signal ;
   unsigned int jobctl ;
   unsigned int personality ;
   unsigned int did_exec : 1 ;
   unsigned int in_execve : 1 ;
   unsigned int in_iowait : 1 ;
   unsigned int sched_reset_on_fork : 1 ;
   unsigned int sched_contributes_to_load : 1 ;
   unsigned int irq_thread : 1 ;
   pid_t pid ;
   pid_t tgid ;
   unsigned long stack_canary ;
   struct task_struct *real_parent ;
   struct task_struct *parent ;
   struct list_head children ;
   struct list_head sibling ;
   struct task_struct *group_leader ;
   struct list_head ptraced ;
   struct list_head ptrace_entry ;
   struct pid_link pids[3] ;
   struct list_head thread_group ;
   struct completion *vfork_done ;
   int *set_child_tid ;
   int *clear_child_tid ;
   cputime_t utime ;
   cputime_t stime ;
   cputime_t utimescaled ;
   cputime_t stimescaled ;
   cputime_t gtime ;
   cputime_t prev_utime ;
   cputime_t prev_stime ;
   unsigned long nvcsw ;
   unsigned long nivcsw ;
   struct timespec start_time ;
   struct timespec real_start_time ;
   unsigned long min_flt ;
   unsigned long maj_flt ;
   struct task_cputime cputime_expires ;
   struct list_head cpu_timers[3] ;
   struct cred const *real_cred ;
   struct cred const *cred ;
   struct cred *replacement_session_keyring ;
   char comm[16] ;
   int link_count ;
   int total_link_count ;
   struct sysv_sem sysvsem ;
   unsigned long last_switch_count ;
   struct thread_struct thread ;
   struct fs_struct *fs ;
   struct files_struct *files ;
   struct nsproxy *nsproxy ;
   struct signal_struct *signal ;
   struct sighand_struct *sighand ;
   sigset_t blocked ;
   sigset_t real_blocked ;
   sigset_t saved_sigmask ;
   struct sigpending pending ;
   unsigned long sas_ss_sp ;
   size_t sas_ss_size ;
   int (*notifier)(void *priv ) ;
   void *notifier_data ;
   sigset_t *notifier_mask ;
   struct audit_context *audit_context ;
   uid_t loginuid ;
   unsigned int sessionid ;
   seccomp_t seccomp ;
   u32 parent_exec_id ;
   u32 self_exec_id ;
   spinlock_t alloc_lock ;
   raw_spinlock_t pi_lock ;
   struct plist_head pi_waiters ;
   struct rt_mutex_waiter *pi_blocked_on ;
   struct mutex_waiter *blocked_on ;
   unsigned int irq_events ;
   unsigned long hardirq_enable_ip ;
   unsigned long hardirq_disable_ip ;
   unsigned int hardirq_enable_event ;
   unsigned int hardirq_disable_event ;
   int hardirqs_enabled ;
   int hardirq_context ;
   unsigned long softirq_disable_ip ;
   unsigned long softirq_enable_ip ;
   unsigned int softirq_disable_event ;
   unsigned int softirq_enable_event ;
   int softirqs_enabled ;
   int softirq_context ;
   void *journal_info ;
   struct bio_list *bio_list ;
   struct blk_plug *plug ;
   struct reclaim_state *reclaim_state ;
   struct backing_dev_info *backing_dev_info ;
   struct io_context *io_context ;
   unsigned long ptrace_message ;
   siginfo_t *last_siginfo ;
   struct task_io_accounting ioac ;
   u64 acct_rss_mem1 ;
   u64 acct_vm_mem1 ;
   cputime_t acct_timexpd ;
   nodemask_t mems_allowed ;
   seqcount_t mems_allowed_seq ;
   int cpuset_mem_spread_rotor ;
   int cpuset_slab_spread_rotor ;
   struct css_set *cgroups ;
   struct list_head cg_list ;
   struct robust_list_head *robust_list ;
   struct compat_robust_list_head *compat_robust_list ;
   struct list_head pi_state_list ;
   struct futex_pi_state *pi_state_cache ;
   struct perf_event_context *perf_event_ctxp[2] ;
   struct mutex perf_event_mutex ;
   struct list_head perf_event_list ;
   struct mempolicy *mempolicy ;
   short il_next ;
   short pref_node_fork ;
   struct rcu_head rcu ;
   struct pipe_inode_info *splice_pipe ;
   struct task_delay_info *delays ;
   int make_it_fail ;
   int nr_dirtied ;
   int nr_dirtied_pause ;
   unsigned long dirty_paused_when ;
   int latency_record_count ;
   struct latency_record latency_record[32] ;
   unsigned long timer_slack_ns ;
   unsigned long default_timer_slack_ns ;
   struct list_head *scm_work_list ;
   unsigned long trace ;
   unsigned long trace_recursion ;
   struct memcg_batch_info memcg_batch ;
   atomic_t ptrace_bp_refcnt ;
};
struct pid_namespace;
#pragma pack(1)
struct acpi_table_header {
   char signature[4] ;
   u32 length ;
   u8 revision ;
   u8 checksum ;
   char oem_id[6] ;
   char oem_table_id[8] ;
   u32 oem_revision ;
   char asl_compiler_id[4] ;
   u32 asl_compiler_revision ;
};
struct acpi_generic_address {
   u8 space_id ;
   u8 bit_width ;
   u8 bit_offset ;
   u8 access_width ;
   u64 address ;
};
struct acpi_table_fadt {
   struct acpi_table_header header ;
   u32 facs ;
   u32 dsdt ;
   u8 model ;
   u8 preferred_profile ;
   u16 sci_interrupt ;
   u32 smi_command ;
   u8 acpi_enable ;
   u8 acpi_disable ;
   u8 S4bios_request ;
   u8 pstate_control ;
   u32 pm1a_event_block ;
   u32 pm1b_event_block ;
   u32 pm1a_control_block ;
   u32 pm1b_control_block ;
   u32 pm2_control_block ;
   u32 pm_timer_block ;
   u32 gpe0_block ;
   u32 gpe1_block ;
   u8 pm1_event_length ;
   u8 pm1_control_length ;
   u8 pm2_control_length ;
   u8 pm_timer_length ;
   u8 gpe0_block_length ;
   u8 gpe1_block_length ;
   u8 gpe1_base ;
   u8 cst_control ;
   u16 C2latency ;
   u16 C3latency ;
   u16 flush_size ;
   u16 flush_stride ;
   u8 duty_offset ;
   u8 duty_width ;
   u8 day_alarm ;
   u8 month_alarm ;
   u8 century ;
   u16 boot_flags ;
   u8 reserved ;
   u32 flags ;
   struct acpi_generic_address reset_register ;
   u8 reset_value ;
   u8 reserved4[3] ;
   u64 Xfacs ;
   u64 Xdsdt ;
   struct acpi_generic_address xpm1a_event_block ;
   struct acpi_generic_address xpm1b_event_block ;
   struct acpi_generic_address xpm1a_control_block ;
   struct acpi_generic_address xpm1b_control_block ;
   struct acpi_generic_address xpm2_control_block ;
   struct acpi_generic_address xpm_timer_block ;
   struct acpi_generic_address xgpe0_block ;
   struct acpi_generic_address xgpe1_block ;
   struct acpi_generic_address sleep_control ;
   struct acpi_generic_address sleep_status ;
};
#pragma pack()
#pragma pack(1)
#pragma pack()
#pragma pack(1)
#pragma pack()
#pragma pack(1)
#pragma pack()
#pragma pack(1)
#pragma pack()
struct completion;
struct mm_struct;
struct pid_namespace;
struct nsproxy;
struct device;
struct exception_table_entry {
   unsigned long insn ;
   unsigned long fixup ;
};
struct pt_regs;
struct notifier_block;
struct pt_regs;
struct seq_file;
struct module;
struct module;
struct pt_regs;
struct notifier_block;
struct task_struct;
struct mm_struct;
struct pt_regs;
struct task_struct;
struct device;
struct seq_file;
struct seq_operations;
struct file;
struct path;
struct inode;
struct dentry;
struct seq_file {
   char *buf ;
   size_t size ;
   size_t from ;
   size_t count ;
   loff_t index ;
   loff_t read_pos ;
   u64 version ;
   struct mutex lock ;
   struct seq_operations const *op ;
   int poll_event ;
   void *private ;
};
struct seq_operations {
   void *(*start)(struct seq_file *m , loff_t *pos ) ;
   void (*stop)(struct seq_file *m , void *v ) ;
   void *(*next)(struct seq_file *m , void *v , loff_t *pos ) ;
   int (*show)(struct seq_file *m , void *v ) ;
};
struct file_operations;
struct inode;
struct module;
struct cdev {
   struct kobject kobj ;
   struct module *owner ;
   struct file_operations const *ops ;
   struct list_head list ;
   dev_t dev ;
   unsigned int count ;
};
struct poll_table_struct;
struct poll_table_struct {
   void (*_qproc)(struct file * , wait_queue_head_t * , struct poll_table_struct * ) ;
   unsigned long _key ;
};
enum kmsg_dump_reason {
    KMSG_DUMP_PANIC = 0,
    KMSG_DUMP_OOPS = 1,
    KMSG_DUMP_EMERG = 2,
    KMSG_DUMP_RESTART = 3,
    KMSG_DUMP_HALT = 4,
    KMSG_DUMP_POWEROFF = 5
} ;
enum pstore_type_id {
    PSTORE_TYPE_DMESG = 0,
    PSTORE_TYPE_MCE = 1,
    PSTORE_TYPE_UNKNOWN = 255
} ;
struct pstore_info {
   struct module *owner ;
   char *name ;
   spinlock_t buf_lock ;
   char *buf ;
   size_t bufsize ;
   struct mutex read_mutex ;
   int (*open)(struct pstore_info *psi ) ;
   int (*close)(struct pstore_info *psi ) ;
   ssize_t (*read)(u64 *id , enum pstore_type_id *type , struct timespec *time , char **buf ,
                   struct pstore_info *psi ) ;
   int (*write)(enum pstore_type_id type , enum kmsg_dump_reason reason , u64 *id ,
                unsigned int part , size_t size , struct pstore_info *psi ) ;
   int (*erase)(enum pstore_type_id type , u64 id , struct pstore_info *psi ) ;
   void *data ;
};
typedef unsigned long efi_status_t;
typedef u16 efi_char16_t;
struct __anonstruct_efi_guid_t_262 {
   u8 b[16] ;
};
typedef struct __anonstruct_efi_guid_t_262 efi_guid_t;
typedef efi_status_t efi_get_variable_t(efi_char16_t *name , efi_guid_t *vendor ,
                                        u32 *attr , unsigned long *data_size , void *data );
typedef efi_status_t efi_get_next_variable_t(unsigned long *name_size , efi_char16_t *name ,
                                             efi_guid_t *vendor );
typedef efi_status_t efi_set_variable_t(efi_char16_t *name , efi_guid_t *vendor ,
                                        u32 attr , unsigned long data_size , void *data );
struct efivar_operations {
   efi_get_variable_t *get_variable ;
   efi_get_next_variable_t *get_next_variable ;
   efi_set_variable_t *set_variable ;
};
struct efivar_entry;
struct efivars {
   spinlock_t lock ;
   struct list_head list ;
   struct kset *kset ;
   struct bin_attribute *new_var ;
   struct bin_attribute *del_var ;
   struct efivar_operations const *ops ;
   struct efivar_entry *walk_entry ;
   struct pstore_info efi_pstore_info ;
};
struct cred;
struct file;
struct task_struct;
typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
struct elf64_sym {
   Elf64_Word st_name ;
   unsigned char st_info ;
   unsigned char st_other ;
   Elf64_Half st_shndx ;
   Elf64_Addr st_value ;
   Elf64_Xword st_size ;
};
typedef struct elf64_sym Elf64_Sym;
struct file;
struct kernel_param;
struct kernel_param;
struct kernel_param_ops {
   int (*set)(char const *val , struct kernel_param const *kp ) ;
   int (*get)(char *buffer , struct kernel_param const *kp ) ;
   void (*free)(void *arg ) ;
};
struct kparam_string;
struct kparam_array;
union __anonunion____missing_field_name_284 {
   void *arg ;
   struct kparam_string const *str ;
   struct kparam_array const *arr ;
};
struct kernel_param {
   char const *name ;
   struct kernel_param_ops const *ops ;
   u16 perm ;
   s16 level ;
   union __anonunion____missing_field_name_284 __annonCompField46 ;
};
struct kparam_string {
   unsigned int maxlen ;
   char *string ;
};
struct kparam_array {
   unsigned int max ;
   unsigned int elemsize ;
   unsigned int *num ;
   struct kernel_param_ops const *ops ;
   void *elem ;
};
struct module;
struct module;
struct static_key {
   atomic_t enabled ;
};
struct module;
struct tracepoint;
struct tracepoint;
struct tracepoint_func {
   void *func ;
   void *data ;
};
struct tracepoint {
   char const *name ;
   struct static_key key ;
   void (*regfunc)(void) ;
   void (*unregfunc)(void) ;
   struct tracepoint_func *funcs ;
};
struct kernel_symbol {
   unsigned long value ;
   char const *name ;
};
struct mod_arch_specific {
};
struct module;
struct module_param_attrs;
struct module_kobject {
   struct kobject kobj ;
   struct module *mod ;
   struct kobject *drivers_dir ;
   struct module_param_attrs *mp ;
};
struct module_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct module_attribute * , struct module_kobject * , char * ) ;
   ssize_t (*store)(struct module_attribute * , struct module_kobject * , char const * ,
                    size_t count ) ;
   void (*setup)(struct module * , char const * ) ;
   int (*test)(struct module * ) ;
   void (*free)(struct module * ) ;
};
struct exception_table_entry;
struct notifier_block;
enum module_state {
    MODULE_STATE_LIVE = 0,
    MODULE_STATE_COMING = 1,
    MODULE_STATE_GOING = 2
} ;
struct module_ref {
   unsigned long incs ;
   unsigned long decs ;
} __attribute__((__aligned__((2) * (sizeof(unsigned long )) ))) ;
struct module_sect_attrs;
struct module_notes_attrs;
struct ftrace_event_call;
struct module {
   enum module_state state ;
   struct list_head list ;
   char name[64UL - sizeof(unsigned long )] ;
   struct module_kobject mkobj ;
   struct module_attribute *modinfo_attrs ;
   char const *version ;
   char const *srcversion ;
   struct kobject *holders_dir ;
   struct kernel_symbol const *syms ;
   unsigned long const *crcs ;
   unsigned int num_syms ;
   struct kernel_param *kp ;
   unsigned int num_kp ;
   unsigned int num_gpl_syms ;
   struct kernel_symbol const *gpl_syms ;
   unsigned long const *gpl_crcs ;
   struct kernel_symbol const *unused_syms ;
   unsigned long const *unused_crcs ;
   unsigned int num_unused_syms ;
   unsigned int num_unused_gpl_syms ;
   struct kernel_symbol const *unused_gpl_syms ;
   unsigned long const *unused_gpl_crcs ;
   struct kernel_symbol const *gpl_future_syms ;
   unsigned long const *gpl_future_crcs ;
   unsigned int num_gpl_future_syms ;
   unsigned int num_exentries ;
   struct exception_table_entry *extable ;
   int (*init)(void) ;
   void *module_init ;
   void *module_core ;
   unsigned int init_size ;
   unsigned int core_size ;
   unsigned int init_text_size ;
   unsigned int core_text_size ;
   unsigned int init_ro_size ;
   unsigned int core_ro_size ;
   struct mod_arch_specific arch ;
   unsigned int taints ;
   unsigned int num_bugs ;
   struct list_head bug_list ;
   struct bug_entry *bug_table ;
   Elf64_Sym *symtab ;
   Elf64_Sym *core_symtab ;
   unsigned int num_symtab ;
   unsigned int core_num_syms ;
   char *strtab ;
   char *core_strtab ;
   struct module_sect_attrs *sect_attrs ;
   struct module_notes_attrs *notes_attrs ;
   char *args ;
   void *percpu ;
   unsigned int percpu_size ;
   unsigned int num_tracepoints ;
   struct tracepoint * const *tracepoints_ptrs ;
   unsigned int num_trace_bprintk_fmt ;
   char const **trace_bprintk_fmt_start ;
   struct ftrace_event_call **trace_events ;
   unsigned int num_trace_events ;
   struct list_head source_list ;
   struct list_head target_list ;
   struct task_struct *waiter ;
   void (*exit)(void) ;
   struct module_ref *refptr ;
   ctor_fn_t *ctors ;
   unsigned int num_ctors ;
};
struct gsmi_buf {
   u8 *start ;
   size_t length ;
   dma_addr_t handle ;
   u32 address ;
};
struct gsmi_device {
   struct platform_device *pdev ;
   struct gsmi_buf *name_buf ;
   struct gsmi_buf *data_buf ;
   struct gsmi_buf *param_buf ;
   spinlock_t lock ;
   u16 smi_cmd ;
   int handshake_type ;
   struct dma_pool *dma_pool ;
};
struct gsmi_nvram_var_param {
   efi_guid_t guid ;
   u32 name_ptr ;
   u32 attributes ;
   u32 data_len ;
   u32 data_ptr ;
} __attribute__((__packed__)) ;
struct gsmi_get_next_var_param {
   u8 guid[16] ;
   u32 name_ptr ;
   u32 name_len ;
} __attribute__((__packed__)) ;
struct gsmi_set_eventlog_param {
   u32 data_ptr ;
   u32 data_len ;
   u32 type ;
} __attribute__((__packed__)) ;
struct gsmi_log_entry_type_1 {
   u16 type ;
   u32 instance ;
} __attribute__((__packed__)) ;
struct __anonstruct_param_288 {
   u32 percentage ;
   u32 data_type ;
};
long ldv__builtin_expect(long val , long res ) ;
extern int ( printk)(char const *fmt , ...) ;
extern struct atomic_notifier_head panic_notifier_list ;
extern int __attribute__((__warn_unused_result__)) _kstrtoul(char const *s , unsigned int base ,
                                                              unsigned long *res ) ;
extern int __attribute__((__warn_unused_result__)) kstrtoull(char const *s , unsigned int base ,
                                                              unsigned long long *res ) ;
__inline static int __attribute__((__warn_unused_result__)) kstrtoul(char const *s ,
                                                                      unsigned int base ,
                                                                      unsigned long *res ) __attribute__((__no_instrument_function__)) ;
__inline static int __attribute__((__warn_unused_result__)) kstrtoul(char const *s ,
                                                                      unsigned int base ,
                                                                      unsigned long *res )
{ int tmp ;
  int tmp___0 ;
  unsigned long long *__cil_tmp6 ;
  {
  if (8UL == 8UL) {
    if (8UL == 8UL) {
      {
      __cil_tmp6 = (unsigned long long *)res;
      tmp = (int )kstrtoull(s, base, __cil_tmp6);
      }
      return (tmp);
    } else {
      {
      tmp___0 = (int )_kstrtoul(s, base, res);
      }
      return (tmp___0);
    }
  } else {
    {
    tmp___0 = (int )_kstrtoul(s, base, res);
    }
    return (tmp___0);
  }
}
}
extern unsigned long __phys_addr(unsigned long ) ;
extern void *memmove(void *to , void const *from , size_t len ) ;
extern void *memset(void *s , int c , size_t n ) ;
extern int strncmp(char const * , char const * , __kernel_size_t ) ;
__inline static long __attribute__((__warn_unused_result__)) PTR_ERR(void const *ptr ) __attribute__((__no_instrument_function__)) ;
__inline static long __attribute__((__warn_unused_result__)) PTR_ERR(void const *ptr )
{
  {
  return ((long )ptr);
}
}
__inline static long __attribute__((__warn_unused_result__)) IS_ERR(void const *ptr ) __attribute__((__no_instrument_function__)) ;
__inline static long __attribute__((__warn_unused_result__)) IS_ERR(void const *ptr )
{ long tmp ;
  unsigned long __cil_tmp3 ;
  int __cil_tmp4 ;
  int __cil_tmp5 ;
  int __cil_tmp6 ;
  long __cil_tmp7 ;
  {
  {
  __cil_tmp3 = (unsigned long )ptr;
  __cil_tmp4 = __cil_tmp3 >= 0xfffffffffffff001UL;
  __cil_tmp5 = ! __cil_tmp4;
  __cil_tmp6 = ! __cil_tmp5;
  __cil_tmp7 = (long )__cil_tmp6;
  tmp = ldv__builtin_expect(__cil_tmp7, 0L);
  }
  return (tmp);
}
}
extern int __attribute__((__warn_unused_result__)) sysfs_create_files(struct kobject *kobj ,
                                                                       struct attribute const **attr ) ;
extern void sysfs_remove_files(struct kobject *kobj , struct attribute const **attr ) ;
extern int __attribute__((__warn_unused_result__)) sysfs_create_bin_file(struct kobject *kobj ,
                                                                          struct bin_attribute const *attr ) ;
extern void sysfs_remove_bin_file(struct kobject *kobj , struct bin_attribute const *attr ) ;
extern void __raw_spin_lock_init(raw_spinlock_t *lock , char const *name , struct lock_class_key *key ) ;
extern unsigned long _raw_spin_lock_irqsave(raw_spinlock_t *lock ) __attribute__((__section__(".spinlock.text"))) ;
extern void _raw_spin_unlock_irqrestore(raw_spinlock_t *lock , unsigned long flags ) __attribute__((__section__(".spinlock.text"))) ;
__inline static raw_spinlock_t *spinlock_check(spinlock_t *lock ) __attribute__((__no_instrument_function__)) ;
__inline static raw_spinlock_t *spinlock_check(spinlock_t *lock )
{
  {
  return ((struct raw_spinlock *)lock);
}
}
__inline static void spin_unlock_irqrestore(spinlock_t *lock , unsigned long flags ) __attribute__((__no_instrument_function__)) ;
__inline static void spin_unlock_irqrestore(spinlock_t *lock , unsigned long flags )
{ struct raw_spinlock *__cil_tmp5 ;
  {
  {
  while (1) {
    while_continue: ;
    {
    __cil_tmp5 = (struct raw_spinlock *)lock;
    _raw_spin_unlock_irqrestore(__cil_tmp5, flags);
    }
    goto while_break;
  }
  while_break: ;
  }
  return;
}
}
extern struct kobject * __attribute__((__warn_unused_result__)) kobject_create_and_add(char const *name ,
                                                                                       struct kobject *parent ) ;
extern void kobject_put(struct kobject *kobj ) ;
extern struct kobject *firmware_kobj ;
void mutex_lock(struct mutex *lock ) ;
int __attribute__((__warn_unused_result__)) mutex_lock_interruptible(struct mutex *lock ) ;
int __attribute__((__warn_unused_result__)) mutex_lock_killable(struct mutex *lock ) ;
int mutex_trylock(struct mutex *lock ) ;
void mutex_unlock(struct mutex *lock ) ;
int atomic_dec_and_mutex_lock(atomic_t *cnt , struct mutex *lock ) ;
extern void platform_device_unregister(struct platform_device * ) ;
extern struct platform_device *platform_device_register_full(struct platform_device_info const *pdevinfo ) ;
__inline static struct platform_device *platform_device_register_resndata(struct device *parent ,
                                                                          char const *name ,
                                                                          int id ,
                                                                          struct resource const *res ,
                                                                          unsigned int num ,
                                                                          void const *data ,
                                                                          size_t size ) __attribute__((__no_instrument_function__)) ;
__inline static struct platform_device *platform_device_register_resndata(struct device *parent ,
                                                                          char const *name ,
                                                                          int id ,
                                                                          struct resource const *res ,
                                                                          unsigned int num ,
                                                                          void const *data ,
                                                                          size_t size )
{ struct platform_device_info pdevinfo ;
  struct platform_device *tmp ;
  struct platform_device_info *__cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  struct platform_device_info const *__cil_tmp18 ;
  {
  {
  __cil_tmp10 = & pdevinfo;
  *((struct device **)__cil_tmp10) = parent;
  __cil_tmp11 = (unsigned long )(& pdevinfo) + 8;
  *((char const **)__cil_tmp11) = name;
  __cil_tmp12 = (unsigned long )(& pdevinfo) + 16;
  *((int *)__cil_tmp12) = id;
  __cil_tmp13 = (unsigned long )(& pdevinfo) + 24;
  *((struct resource const **)__cil_tmp13) = res;
  __cil_tmp14 = (unsigned long )(& pdevinfo) + 32;
  *((unsigned int *)__cil_tmp14) = num;
  __cil_tmp15 = (unsigned long )(& pdevinfo) + 40;
  *((void const **)__cil_tmp15) = data;
  __cil_tmp16 = (unsigned long )(& pdevinfo) + 48;
  *((size_t *)__cil_tmp16) = size;
  __cil_tmp17 = (unsigned long )(& pdevinfo) + 56;
  *((u64 *)__cil_tmp17) = (u64 )0;
  __cil_tmp18 = (struct platform_device_info const *)(& pdevinfo);
  tmp = platform_device_register_full(__cil_tmp18);
  }
  return (tmp);
}
}
__inline static struct platform_device *platform_device_register_simple(char const *name ,
                                                                        int id , struct resource const *res ,
                                                                        unsigned int num ) __attribute__((__no_instrument_function__)) ;
__inline static struct platform_device *platform_device_register_simple(char const *name ,
                                                                        int id , struct resource const *res ,
                                                                        unsigned int num )
{ struct platform_device *tmp ;
  void *__cil_tmp6 ;
  struct device *__cil_tmp7 ;
  void *__cil_tmp8 ;
  void const *__cil_tmp9 ;
  size_t __cil_tmp10 ;
  {
  {
  __cil_tmp6 = (void *)0;
  __cil_tmp7 = (struct device *)__cil_tmp6;
  __cil_tmp8 = (void *)0;
  __cil_tmp9 = (void const *)__cil_tmp8;
  __cil_tmp10 = (size_t )0;
  tmp = platform_device_register_resndata(__cil_tmp7, name, id, res, num, __cil_tmp9,
                                          __cil_tmp10);
  }
  return (tmp);
}
}
extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh , struct notifier_block *nb ) ;
extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh , struct notifier_block *nb ) ;
__inline static phys_addr_t virt_to_phys(void volatile *address ) __attribute__((__no_instrument_function__)) ;
__inline static phys_addr_t virt_to_phys(void volatile *address )
{ unsigned long tmp ;
  unsigned long __cil_tmp3 ;
  {
  {
  __cil_tmp3 = (unsigned long )address;
  tmp = __phys_addr(__cil_tmp3);
  }
  return ((phys_addr_t )tmp);
}
}
extern struct dma_pool *dma_pool_create(char const *name , struct device *dev ,
                                        size_t size , size_t align , size_t allocation ) ;
extern void dma_pool_destroy(struct dma_pool *pool ) ;
extern void *dma_pool_alloc(struct dma_pool *pool , gfp_t mem_flags , dma_addr_t *handle ) ;
extern void dma_pool_free(struct dma_pool *pool , void *vaddr , dma_addr_t addr ) ;
extern void kfree(void const * ) ;
extern int __VERIFIER_nondet_int(void);
extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}
extern void *malloc(size_t size);
long ldv_is_err(const void *ptr)
{
  return ((unsigned long)ptr > ((unsigned long)-4095));
}
void *ldv_malloc(size_t size)
{
 if (__VERIFIER_nondet_int()) {
  void *res = malloc(size);
  assume_abort_if_not(!ldv_is_err(res));
  return res;
 } else {
  return ((void *)0);
 }
}
void *__kmalloc(size_t size, gfp_t t)
{
 return ldv_malloc(size);
}
__inline static void *( __attribute__((__always_inline__)) kmalloc)(size_t size ,
                                                                    gfp_t flags ) __attribute__((__no_instrument_function__)) ;
__inline static void *( __attribute__((__always_inline__)) kmalloc)(size_t size ,
                                                                    gfp_t flags )
{ void *tmp___2 ;
  {
  {
  tmp___2 = __kmalloc(size, flags);
  }
  return (tmp___2);
}
}
__inline static void *kzalloc(size_t size , gfp_t flags ) __attribute__((__no_instrument_function__)) ;
void *ldv_zalloc(size_t size ) ;
__inline static void *kzalloc(size_t size , gfp_t flags )
{ void *tmp ;
  unsigned int __cil_tmp4 ;
  {
  {
  __cil_tmp4 = flags | 32768U;
  tmp = kmalloc(size, __cil_tmp4);
  }
  return (tmp);
}
}
extern struct acpi_table_fadt acpi_gbl_FADT ;
extern int dmi_check_system(struct dmi_system_id const *list ) ;
extern char const *dmi_get_system_info(int field ) ;
extern int register_die_notifier(struct notifier_block *nb ) ;
extern int unregister_die_notifier(struct notifier_block *nb ) ;
extern int register_reboot_notifier(struct notifier_block * ) ;
extern int unregister_reboot_notifier(struct notifier_block * ) ;
extern int register_efivars(struct efivars *efivars , struct efivar_operations const *ops ,
                            struct kobject *parent_kobj ) ;
extern void unregister_efivars(struct efivars *efivars ) ;
extern struct kernel_param_ops param_ops_uint ;
int init_module(void) ;
void cleanup_module(void) ;
struct gsmi_device gsmi_dev ;
static unsigned int spincount = 65536U;
static char const __param_str_spincount[10] =
  { (char const )'s', (char const )'p', (char const )'i', (char const )'n',
        (char const )'c', (char const )'o', (char const )'u', (char const )'n',
        (char const )'t', (char const )'\000'};
static struct kernel_param const __param_spincount __attribute__((__used__, __unused__,
__section__("__param"), __aligned__(sizeof(void *)))) = {__param_str_spincount, (struct kernel_param_ops const *)(& param_ops_uint),
    (u16 )384, (s16 )0, {(void *)(& spincount)}};
static char const __mod_spincounttype132[24] __attribute__((__used__, __unused__,
__section__(".modinfo"), __aligned__(1))) =
  { (char const )'p', (char const )'a', (char const )'r', (char const )'m',
        (char const )'t', (char const )'y', (char const )'p', (char const )'e',
        (char const )'=', (char const )'s', (char const )'p', (char const )'i',
        (char const )'n', (char const )'c', (char const )'o', (char const )'u',
        (char const )'n', (char const )'t', (char const )':', (char const )'u',
        (char const )'i', (char const )'n', (char const )'t', (char const )'\000'};
static char const __mod_spincount134[83] __attribute__((__used__, __unused__, __section__(".modinfo"),
__aligned__(1))) =
  { (char const )'p', (char const )'a', (char const )'r', (char const )'m',
        (char const )'=', (char const )'s', (char const )'p', (char const )'i',
        (char const )'n', (char const )'c', (char const )'o', (char const )'u',
        (char const )'n', (char const )'t', (char const )':', (char const )'T',
        (char const )'h', (char const )'e', (char const )' ', (char const )'n',
        (char const )'u', (char const )'m', (char const )'b', (char const )'e',
        (char const )'r', (char const )' ', (char const )'o', (char const )'f',
        (char const )' ', (char const )'l', (char const )'o', (char const )'o',
        (char const )'p', (char const )' ', (char const )'i', (char const )'t',
        (char const )'e', (char const )'r', (char const )'a', (char const )'t',
        (char const )'i', (char const )'o', (char const )'n', (char const )'s',
        (char const )' ', (char const )'t', (char const )'o', (char const )' ',
        (char const )'u', (char const )'s', (char const )'e', (char const )' ',
        (char const )'w', (char const )'h', (char const )'e', (char const )'n',
        (char const )' ', (char const )'u', (char const )'s', (char const )'i',
        (char const )'n', (char const )'g', (char const )' ', (char const )'t',
        (char const )'h', (char const )'e', (char const )' ', (char const )'s',
        (char const )'p', (char const )'i', (char const )'n', (char const )' ',
        (char const )'h', (char const )'a', (char const )'n', (char const )'d',
        (char const )'s', (char const )'h', (char const )'a', (char const )'k',
        (char const )'e', (char const )'.', (char const )'\000'};
static struct gsmi_buf *gsmi_buf_alloc(void)
{ struct gsmi_buf *smibuf ;
  void *tmp___7 ;
  void *tmp___8 ;
  phys_addr_t tmp___9 ;
  void *__cil_tmp5 ;
  unsigned long __cil_tmp6 ;
  struct dma_pool *__cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  dma_addr_t *__cil_tmp10 ;
  u8 *__cil_tmp11 ;
  void const *__cil_tmp12 ;
  void *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  u8 *__cil_tmp16 ;
  void volatile *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  {
  {
  tmp___7 = kzalloc(32UL, 208U);
  smibuf = (struct gsmi_buf *)tmp___7;
  }
  if (! smibuf) {
    {
    printk("<3>gsmi: out of memory\n");
    }
    {
    __cil_tmp5 = (void *)0;
    return ((struct gsmi_buf *)__cil_tmp5);
    }
  } else {
  }
  {
  __cil_tmp6 = (unsigned long )(& gsmi_dev) + 64;
  __cil_tmp7 = *((struct dma_pool **)__cil_tmp6);
  __cil_tmp8 = (unsigned long )smibuf;
  __cil_tmp9 = __cil_tmp8 + 16;
  __cil_tmp10 = (dma_addr_t *)__cil_tmp9;
  tmp___8 = dma_pool_alloc(__cil_tmp7, 208U, __cil_tmp10);
  *((u8 **)smibuf) = (u8 *)tmp___8;
  }
  {
  __cil_tmp11 = *((u8 **)smibuf);
  if (! __cil_tmp11) {
    {
    printk("<3>gsmi: failed to allocate name buffer\n");
    __cil_tmp12 = (void const *)smibuf;
    kfree(__cil_tmp12);
    }
    {
    __cil_tmp13 = (void *)0;
    return ((struct gsmi_buf *)__cil_tmp13);
    }
  } else {
  }
  }
  {
  __cil_tmp14 = (unsigned long )smibuf;
  __cil_tmp15 = __cil_tmp14 + 8;
  *((size_t *)__cil_tmp15) = (size_t )1024;
  __cil_tmp16 = *((u8 **)smibuf);
  __cil_tmp17 = (void volatile *)__cil_tmp16;
  tmp___9 = virt_to_phys(__cil_tmp17);
  __cil_tmp18 = (unsigned long )smibuf;
  __cil_tmp19 = __cil_tmp18 + 24;
  *((u32 *)__cil_tmp19) = (u32 )tmp___9;
  }
  return (smibuf);
}
}
static void gsmi_buf_free(struct gsmi_buf *smibuf )
{ unsigned long __cil_tmp2 ;
  struct dma_pool *__cil_tmp3 ;
  u8 *__cil_tmp4 ;
  void *__cil_tmp5 ;
  unsigned long __cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  dma_addr_t __cil_tmp8 ;
  void const *__cil_tmp9 ;
  {
  if (smibuf) {
    if (*((u8 **)smibuf)) {
      {
      __cil_tmp2 = (unsigned long )(& gsmi_dev) + 64;
      __cil_tmp3 = *((struct dma_pool **)__cil_tmp2);
      __cil_tmp4 = *((u8 **)smibuf);
      __cil_tmp5 = (void *)__cil_tmp4;
      __cil_tmp6 = (unsigned long )smibuf;
      __cil_tmp7 = __cil_tmp6 + 16;
      __cil_tmp8 = *((dma_addr_t *)__cil_tmp7);
      dma_pool_free(__cil_tmp3, __cil_tmp5, __cil_tmp8);
      }
    } else {
    }
    {
    __cil_tmp9 = (void const *)smibuf;
    kfree(__cil_tmp9);
    }
  } else {
  }
  return;
}
}
static int gsmi_exec(u8 func , u8 sub )
{ u16 cmd ;
  u16 result ;
  int rc ;
  int __cil_tmp6 ;
  int __cil_tmp7 ;
  int __cil_tmp8 ;
  int __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  int __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  struct gsmi_buf *__cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  int __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  struct gsmi_buf *__cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned int *__cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct gsmi_buf *__cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  int __cil_tmp30 ;
  int __cil_tmp31 ;
  int __cil_tmp32 ;
  int __cil_tmp33 ;
  int __cil_tmp34 ;
  int __cil_tmp35 ;
  int __cil_tmp36 ;
  int __cil_tmp37 ;
  int __cil_tmp38 ;
  int __cil_tmp39 ;
  {
  __cil_tmp6 = (int )func;
  __cil_tmp7 = (int )sub;
  __cil_tmp8 = __cil_tmp7 << 8;
  __cil_tmp9 = __cil_tmp8 | __cil_tmp6;
  cmd = (u16 )__cil_tmp9;
  result = (u16 )0;
  rc = 0;
  {
  __cil_tmp10 = (unsigned long )(& gsmi_dev) + 60;
  __cil_tmp11 = *((int *)__cil_tmp10);
  if (__cil_tmp11 == 126) {
    __cil_tmp12 = (unsigned long )(& gsmi_dev) + 56;
    __cil_tmp13 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp14 = *((struct gsmi_buf **)__cil_tmp13);
    __cil_tmp15 = (unsigned long )__cil_tmp14;
    __cil_tmp16 = __cil_tmp15 + 24;
    __asm__ volatile ("stc\n"
                         "outb %%al, %%dx\n"
                         "1:      jc 1b\n": "=a" (result): "0" (cmd), "d" (*((u16 *)__cil_tmp12)),
                         "b" (*((u32 *)__cil_tmp16)): "memory", "cc");
  } else {
    {
    __cil_tmp17 = (unsigned long )(& gsmi_dev) + 60;
    __cil_tmp18 = *((int *)__cil_tmp17);
    if (__cil_tmp18 == 125) {
      __cil_tmp19 = (unsigned long )(& gsmi_dev) + 56;
      __cil_tmp20 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp21 = *((struct gsmi_buf **)__cil_tmp20);
      __cil_tmp22 = (unsigned long )__cil_tmp21;
      __cil_tmp23 = __cil_tmp22 + 24;
      __cil_tmp24 = & spincount;
      __asm__ volatile ("outb %%al, %%dx\n"
                           "1:      loop 1b\n": "=a" (result): "0" (cmd), "d" (*((u16 *)__cil_tmp19)),
                           "b" (*((u32 *)__cil_tmp23)), "c" (*__cil_tmp24): "memory",
                           "cc");
    } else {
      __cil_tmp25 = (unsigned long )(& gsmi_dev) + 56;
      __cil_tmp26 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp27 = *((struct gsmi_buf **)__cil_tmp26);
      __cil_tmp28 = (unsigned long )__cil_tmp27;
      __cil_tmp29 = __cil_tmp28 + 24;
      __asm__ volatile ("outb %%al, %%dx\n\t": "=a" (result): "0" (cmd), "d" (*((u16 *)__cil_tmp25)),
                           "b" (*((u32 *)__cil_tmp29)): "memory", "cc");
    }
    }
  }
  }
  if ((int )result == 0) {
    goto case_0;
  } else
  if ((int )result == 14) {
    goto case_14;
  } else
  if ((int )result == 130) {
    goto case_130;
  } else
  if ((int )result == 133) {
    goto case_133;
  } else
  if ((int )result == 131) {
    goto case_131;
  } else
  if ((int )result == 3) {
    goto case_131;
  } else
  if ((int )result == 134) {
    goto case_134;
  } else
  if ((int )result == 135) {
    goto case_135;
  } else
  if ((int )result == 142) {
    goto case_142;
  } else
  if ((int )result == 11) {
    goto case_11;
  } else
  if ((int )result == 126) {
    goto case_126;
  } else
  if ((int )result == 125) {
    goto case_126;
  } else
  if ((int )result == 127) {
    goto case_126;
  } else {
    {
    goto switch_default;
    if (0) {
      case_0:
      goto switch_break;
      case_14:
      rc = 1;
      goto switch_break;
      case_130:
      {
      __cil_tmp30 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Invalid parameter\n", __cil_tmp30);
      rc = -22;
      }
      goto switch_break;
      case_133:
      {
      __cil_tmp31 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Buffer too small\n", __cil_tmp31);
      rc = -12;
      }
      goto switch_break;
      case_131:
      case_3:
      {
      __cil_tmp32 = (int )sub;
      if (__cil_tmp32 != 193) {
        {
        __cil_tmp33 = (int )cmd;
        printk("<3>gsmi: exec 0x%04x: Not supported\n", __cil_tmp33);
        }
      } else {
      }
      }
      rc = -38;
      goto switch_break;
      case_134:
      {
      __cil_tmp34 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Not ready\n", __cil_tmp34);
      rc = -16;
      }
      goto switch_break;
      case_135:
      {
      __cil_tmp35 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Device error\n", __cil_tmp35);
      rc = -14;
      }
      goto switch_break;
      case_142:
      {
      __cil_tmp36 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Data not found\n", __cil_tmp36);
      rc = -2;
      }
      goto switch_break;
      case_11:
      {
      __cil_tmp37 = (int )cmd;
      printk("<3>gsmi: exec 0x%04x: Log full\n", __cil_tmp37);
      rc = -28;
      }
      goto switch_break;
      case_126:
      case_125:
      case_127:
      rc = (int )result;
      goto switch_break;
      switch_default:
      {
      __cil_tmp38 = (int )cmd;
      __cil_tmp39 = (int )result;
      printk("<3>gsmi: exec 0x%04x: Unknown error 0x%04x\n", __cil_tmp38, __cil_tmp39);
      rc = -6;
      }
    } else {
      switch_break: ;
    }
    }
  }
  return (rc);
}
}
static size_t utf16_strlen(efi_char16_t *data , unsigned long maxlength )
{ unsigned long length ;
  efi_char16_t *tmp___7 ;
  efi_char16_t __cil_tmp5 ;
  int __cil_tmp6 ;
  {
  length = 0UL;
  {
  while (1) {
    while_continue: ;
    tmp___7 = data;
    data = data + 1;
    {
    __cil_tmp5 = *tmp___7;
    __cil_tmp6 = (int )__cil_tmp5;
    if (__cil_tmp6 != 0) {
      if (length < maxlength) {
      } else {
        goto while_break;
      }
    } else {
      goto while_break;
    }
    }
    length = length + 1UL;
  }
  while_break: ;
  }
  return (length);
}
}
static efi_status_t gsmi_get_variable(efi_char16_t *name , efi_guid_t *vendor , u32 *attr ,
                                      unsigned long *data_size , void *data )
{ struct gsmi_nvram_var_param param ;
  efi_status_t ret ;
  unsigned long flags ;
  size_t name_len ;
  size_t tmp___7 ;
  int rc ;
  raw_spinlock_t *tmp___8 ;
  size_t __len ;
  void *__ret ;
  size_t __len___0 ;
  void *__ret___0 ;
  size_t __len___1 ;
  void *__ret___1 ;
  size_t __len___2 ;
  void *__ret___2 ;
  unsigned long __min1 ;
  unsigned long __min2 ;
  unsigned long tmp___9 ;
  unsigned long __min1___0 ;
  unsigned long __min2___0 ;
  unsigned long tmp___10 ;
  size_t __len___3 ;
  void *__ret___3 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  unsigned long __cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  unsigned long __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  unsigned long __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  unsigned long __cil_tmp75 ;
  unsigned long __cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  unsigned long __cil_tmp79 ;
  unsigned long __cil_tmp80 ;
  unsigned long __cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  unsigned long __cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  unsigned long __cil_tmp89 ;
  unsigned long __cil_tmp90 ;
  unsigned long __cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  unsigned long __cil_tmp94 ;
  unsigned long __cil_tmp95 ;
  unsigned long __cil_tmp96 ;
  struct gsmi_buf *__cil_tmp97 ;
  unsigned long __cil_tmp98 ;
  unsigned long __cil_tmp99 ;
  unsigned long __cil_tmp100 ;
  unsigned long __cil_tmp101 ;
  unsigned long __cil_tmp102 ;
  unsigned long __cil_tmp103 ;
  unsigned long __cil_tmp104 ;
  struct gsmi_buf *__cil_tmp105 ;
  unsigned long __cil_tmp106 ;
  unsigned long __cil_tmp107 ;
  unsigned long __cil_tmp108 ;
  unsigned long __cil_tmp109 ;
  spinlock_t *__cil_tmp110 ;
  struct gsmi_nvram_var_param *__cil_tmp111 ;
  efi_guid_t *__cil_tmp112 ;
  void *__cil_tmp113 ;
  void const *__cil_tmp114 ;
  struct gsmi_nvram_var_param *__cil_tmp115 ;
  efi_guid_t *__cil_tmp116 ;
  void *__cil_tmp117 ;
  void const *__cil_tmp118 ;
  unsigned long __cil_tmp119 ;
  struct gsmi_buf *__cil_tmp120 ;
  u8 *__cil_tmp121 ;
  void *__cil_tmp122 ;
  unsigned long __cil_tmp123 ;
  struct gsmi_buf *__cil_tmp124 ;
  unsigned long __cil_tmp125 ;
  unsigned long __cil_tmp126 ;
  size_t __cil_tmp127 ;
  unsigned long __cil_tmp128 ;
  struct gsmi_buf *__cil_tmp129 ;
  u8 *__cil_tmp130 ;
  void *__cil_tmp131 ;
  void const *__cil_tmp132 ;
  unsigned long __cil_tmp133 ;
  struct gsmi_buf *__cil_tmp134 ;
  u8 *__cil_tmp135 ;
  void *__cil_tmp136 ;
  unsigned long __cil_tmp137 ;
  struct gsmi_buf *__cil_tmp138 ;
  unsigned long __cil_tmp139 ;
  unsigned long __cil_tmp140 ;
  size_t __cil_tmp141 ;
  unsigned long __cil_tmp142 ;
  struct gsmi_buf *__cil_tmp143 ;
  u8 *__cil_tmp144 ;
  void *__cil_tmp145 ;
  unsigned long __cil_tmp146 ;
  struct gsmi_buf *__cil_tmp147 ;
  unsigned long __cil_tmp148 ;
  unsigned long __cil_tmp149 ;
  size_t __cil_tmp150 ;
  unsigned long __cil_tmp151 ;
  struct gsmi_buf *__cil_tmp152 ;
  u8 *__cil_tmp153 ;
  void *__cil_tmp154 ;
  void const *__cil_tmp155 ;
  unsigned long __cil_tmp156 ;
  struct gsmi_buf *__cil_tmp157 ;
  u8 *__cil_tmp158 ;
  void *__cil_tmp159 ;
  void const *__cil_tmp160 ;
  u8 __cil_tmp161 ;
  u8 __cil_tmp162 ;
  unsigned long __cil_tmp163 ;
  unsigned long __cil_tmp164 ;
  void *__cil_tmp165 ;
  unsigned long __cil_tmp166 ;
  struct gsmi_buf *__cil_tmp167 ;
  u8 *__cil_tmp168 ;
  void const *__cil_tmp169 ;
  void *__cil_tmp170 ;
  unsigned long __cil_tmp171 ;
  struct gsmi_buf *__cil_tmp172 ;
  u8 *__cil_tmp173 ;
  void const *__cil_tmp174 ;
  unsigned long __cil_tmp175 ;
  struct gsmi_buf *__cil_tmp176 ;
  unsigned long __cil_tmp177 ;
  unsigned long __cil_tmp178 ;
  unsigned long __cil_tmp179 ;
  u32 __cil_tmp180 ;
  unsigned long __cil_tmp181 ;
  struct gsmi_buf *__cil_tmp182 ;
  u8 *__cil_tmp183 ;
  void const *__cil_tmp184 ;
  unsigned long __cil_tmp185 ;
  spinlock_t *__cil_tmp186 ;
  {
  {
  __cil_tmp31 = 0 * 1UL;
  __cil_tmp32 = 0 + __cil_tmp31;
  __cil_tmp33 = 0 + __cil_tmp32;
  __cil_tmp34 = (unsigned long )(& param) + __cil_tmp33;
  *((u8 *)__cil_tmp34) = (unsigned char)0;
  __cil_tmp35 = 1 * 1UL;
  __cil_tmp36 = 0 + __cil_tmp35;
  __cil_tmp37 = 0 + __cil_tmp36;
  __cil_tmp38 = (unsigned long )(& param) + __cil_tmp37;
  *((u8 *)__cil_tmp38) = (unsigned char)0;
  __cil_tmp39 = 2 * 1UL;
  __cil_tmp40 = 0 + __cil_tmp39;
  __cil_tmp41 = 0 + __cil_tmp40;
  __cil_tmp42 = (unsigned long )(& param) + __cil_tmp41;
  *((u8 *)__cil_tmp42) = (unsigned char)0;
  __cil_tmp43 = 3 * 1UL;
  __cil_tmp44 = 0 + __cil_tmp43;
  __cil_tmp45 = 0 + __cil_tmp44;
  __cil_tmp46 = (unsigned long )(& param) + __cil_tmp45;
  *((u8 *)__cil_tmp46) = (unsigned char)0;
  __cil_tmp47 = 4 * 1UL;
  __cil_tmp48 = 0 + __cil_tmp47;
  __cil_tmp49 = 0 + __cil_tmp48;
  __cil_tmp50 = (unsigned long )(& param) + __cil_tmp49;
  *((u8 *)__cil_tmp50) = (unsigned char)0;
  __cil_tmp51 = 5 * 1UL;
  __cil_tmp52 = 0 + __cil_tmp51;
  __cil_tmp53 = 0 + __cil_tmp52;
  __cil_tmp54 = (unsigned long )(& param) + __cil_tmp53;
  *((u8 *)__cil_tmp54) = (unsigned char)0;
  __cil_tmp55 = 6 * 1UL;
  __cil_tmp56 = 0 + __cil_tmp55;
  __cil_tmp57 = 0 + __cil_tmp56;
  __cil_tmp58 = (unsigned long )(& param) + __cil_tmp57;
  *((u8 *)__cil_tmp58) = (unsigned char)0;
  __cil_tmp59 = 7 * 1UL;
  __cil_tmp60 = 0 + __cil_tmp59;
  __cil_tmp61 = 0 + __cil_tmp60;
  __cil_tmp62 = (unsigned long )(& param) + __cil_tmp61;
  *((u8 *)__cil_tmp62) = (unsigned char)0;
  __cil_tmp63 = 8 * 1UL;
  __cil_tmp64 = 0 + __cil_tmp63;
  __cil_tmp65 = 0 + __cil_tmp64;
  __cil_tmp66 = (unsigned long )(& param) + __cil_tmp65;
  *((u8 *)__cil_tmp66) = (unsigned char)0;
  __cil_tmp67 = 9 * 1UL;
  __cil_tmp68 = 0 + __cil_tmp67;
  __cil_tmp69 = 0 + __cil_tmp68;
  __cil_tmp70 = (unsigned long )(& param) + __cil_tmp69;
  *((u8 *)__cil_tmp70) = (unsigned char)0;
  __cil_tmp71 = 10 * 1UL;
  __cil_tmp72 = 0 + __cil_tmp71;
  __cil_tmp73 = 0 + __cil_tmp72;
  __cil_tmp74 = (unsigned long )(& param) + __cil_tmp73;
  *((u8 *)__cil_tmp74) = (unsigned char)0;
  __cil_tmp75 = 11 * 1UL;
  __cil_tmp76 = 0 + __cil_tmp75;
  __cil_tmp77 = 0 + __cil_tmp76;
  __cil_tmp78 = (unsigned long )(& param) + __cil_tmp77;
  *((u8 *)__cil_tmp78) = (unsigned char)0;
  __cil_tmp79 = 12 * 1UL;
  __cil_tmp80 = 0 + __cil_tmp79;
  __cil_tmp81 = 0 + __cil_tmp80;
  __cil_tmp82 = (unsigned long )(& param) + __cil_tmp81;
  *((u8 *)__cil_tmp82) = (unsigned char)0;
  __cil_tmp83 = 13 * 1UL;
  __cil_tmp84 = 0 + __cil_tmp83;
  __cil_tmp85 = 0 + __cil_tmp84;
  __cil_tmp86 = (unsigned long )(& param) + __cil_tmp85;
  *((u8 *)__cil_tmp86) = (unsigned char)0;
  __cil_tmp87 = 14 * 1UL;
  __cil_tmp88 = 0 + __cil_tmp87;
  __cil_tmp89 = 0 + __cil_tmp88;
  __cil_tmp90 = (unsigned long )(& param) + __cil_tmp89;
  *((u8 *)__cil_tmp90) = (unsigned char)0;
  __cil_tmp91 = 15 * 1UL;
  __cil_tmp92 = 0 + __cil_tmp91;
  __cil_tmp93 = 0 + __cil_tmp92;
  __cil_tmp94 = (unsigned long )(& param) + __cil_tmp93;
  *((u8 *)__cil_tmp94) = (unsigned char)0;
  __cil_tmp95 = (unsigned long )(& param) + 16;
  __cil_tmp96 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp97 = *((struct gsmi_buf **)__cil_tmp96);
  __cil_tmp98 = (unsigned long )__cil_tmp97;
  __cil_tmp99 = __cil_tmp98 + 24;
  *((u32 *)__cil_tmp95) = *((u32 *)__cil_tmp99);
  __cil_tmp100 = (unsigned long )(& param) + 20;
  *((u32 *)__cil_tmp100) = 0U;
  __cil_tmp101 = (unsigned long )(& param) + 24;
  __cil_tmp102 = *data_size;
  *((u32 *)__cil_tmp101) = (u32 )__cil_tmp102;
  __cil_tmp103 = (unsigned long )(& param) + 28;
  __cil_tmp104 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp105 = *((struct gsmi_buf **)__cil_tmp104);
  __cil_tmp106 = (unsigned long )__cil_tmp105;
  __cil_tmp107 = __cil_tmp106 + 24;
  *((u32 *)__cil_tmp103) = *((u32 *)__cil_tmp107);
  ret = (efi_status_t )0;
  tmp___7 = utf16_strlen(name, 512UL);
  name_len = tmp___7;
  }
  if (name_len >= 512UL) {
    {
    __cil_tmp108 = 1UL << 63;
    return (4UL | __cil_tmp108);
    }
  } else {
  }
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp109 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp110 = (spinlock_t *)__cil_tmp109;
      tmp___8 = spinlock_check(__cil_tmp110);
      flags = _raw_spin_lock_irqsave(tmp___8);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  __len = 16UL;
  if (__len >= 64UL) {
    {
    __cil_tmp111 = & param;
    __cil_tmp112 = (efi_guid_t *)__cil_tmp111;
    __cil_tmp113 = (void *)__cil_tmp112;
    __cil_tmp114 = (void const *)vendor;
    __ret = memmove(__cil_tmp113, __cil_tmp114, __len);
    }
  } else {
    {
    __cil_tmp115 = & param;
    __cil_tmp116 = (efi_guid_t *)__cil_tmp115;
    __cil_tmp117 = (void *)__cil_tmp116;
    __cil_tmp118 = (void const *)vendor;
    __ret = memmove(__cil_tmp117, __cil_tmp118, __len);
    }
  }
  {
  __cil_tmp119 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp120 = *((struct gsmi_buf **)__cil_tmp119);
  __cil_tmp121 = *((u8 **)__cil_tmp120);
  __cil_tmp122 = (void *)__cil_tmp121;
  __cil_tmp123 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp124 = *((struct gsmi_buf **)__cil_tmp123);
  __cil_tmp125 = (unsigned long )__cil_tmp124;
  __cil_tmp126 = __cil_tmp125 + 8;
  __cil_tmp127 = *((size_t *)__cil_tmp126);
  memset(__cil_tmp122, 0, __cil_tmp127);
  __len___0 = name_len * 2UL;
  __cil_tmp128 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp129 = *((struct gsmi_buf **)__cil_tmp128);
  __cil_tmp130 = *((u8 **)__cil_tmp129);
  __cil_tmp131 = (void *)__cil_tmp130;
  __cil_tmp132 = (void const *)name;
  __ret___0 = memmove(__cil_tmp131, __cil_tmp132, __len___0);
  __cil_tmp133 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp134 = *((struct gsmi_buf **)__cil_tmp133);
  __cil_tmp135 = *((u8 **)__cil_tmp134);
  __cil_tmp136 = (void *)__cil_tmp135;
  __cil_tmp137 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp138 = *((struct gsmi_buf **)__cil_tmp137);
  __cil_tmp139 = (unsigned long )__cil_tmp138;
  __cil_tmp140 = __cil_tmp139 + 8;
  __cil_tmp141 = *((size_t *)__cil_tmp140);
  memset(__cil_tmp136, 0, __cil_tmp141);
  __cil_tmp142 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp143 = *((struct gsmi_buf **)__cil_tmp142);
  __cil_tmp144 = *((u8 **)__cil_tmp143);
  __cil_tmp145 = (void *)__cil_tmp144;
  __cil_tmp146 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp147 = *((struct gsmi_buf **)__cil_tmp146);
  __cil_tmp148 = (unsigned long )__cil_tmp147;
  __cil_tmp149 = __cil_tmp148 + 8;
  __cil_tmp150 = *((size_t *)__cil_tmp149);
  memset(__cil_tmp145, 0, __cil_tmp150);
  __len___1 = 32UL;
  }
  if (__len___1 >= 64UL) {
    {
    __cil_tmp151 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp152 = *((struct gsmi_buf **)__cil_tmp151);
    __cil_tmp153 = *((u8 **)__cil_tmp152);
    __cil_tmp154 = (void *)__cil_tmp153;
    __cil_tmp155 = (void const *)(& param);
    __ret___1 = memmove(__cil_tmp154, __cil_tmp155, __len___1);
    }
  } else {
    {
    __cil_tmp156 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp157 = *((struct gsmi_buf **)__cil_tmp156);
    __cil_tmp158 = *((u8 **)__cil_tmp157);
    __cil_tmp159 = (void *)__cil_tmp158;
    __cil_tmp160 = (void const *)(& param);
    __ret___1 = memmove(__cil_tmp159, __cil_tmp160, __len___1);
    }
  }
  {
  __cil_tmp161 = (u8 )239;
  __cil_tmp162 = (u8 )1;
  rc = gsmi_exec(__cil_tmp161, __cil_tmp162);
  }
  if (rc < 0) {
    {
    printk("<3>gsmi: Get Variable failed\n");
    __cil_tmp163 = 1UL << 63;
    ret = 1UL | __cil_tmp163;
    }
  } else
  if (rc == 1) {
    __cil_tmp164 = 1UL << 63;
    ret = 14UL | __cil_tmp164;
  } else {
    __len___2 = 32UL;
    if (__len___2 >= 64UL) {
      {
      __cil_tmp165 = (void *)(& param);
      __cil_tmp166 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp167 = *((struct gsmi_buf **)__cil_tmp166);
      __cil_tmp168 = *((u8 **)__cil_tmp167);
      __cil_tmp169 = (void const *)__cil_tmp168;
      __ret___2 = memmove(__cil_tmp165, __cil_tmp169, __len___2);
      }
    } else {
      {
      __cil_tmp170 = (void *)(& param);
      __cil_tmp171 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp172 = *((struct gsmi_buf **)__cil_tmp171);
      __cil_tmp173 = *((u8 **)__cil_tmp172);
      __cil_tmp174 = (void const *)__cil_tmp173;
      __ret___2 = memmove(__cil_tmp170, __cil_tmp174, __len___2);
      }
    }
    __min1 = *data_size;
    __cil_tmp175 = (unsigned long )(& gsmi_dev) + 16;
    __cil_tmp176 = *((struct gsmi_buf **)__cil_tmp175);
    __cil_tmp177 = (unsigned long )__cil_tmp176;
    __cil_tmp178 = __cil_tmp177 + 8;
    __min2 = *((size_t *)__cil_tmp178);
    if (__min1 < __min2) {
      tmp___9 = __min1;
    } else {
      tmp___9 = __min2;
    }
    *data_size = tmp___9;
    __min1___0 = *data_size;
    __cil_tmp179 = (unsigned long )(& param) + 24;
    __cil_tmp180 = *((u32 *)__cil_tmp179);
    __min2___0 = (unsigned long )__cil_tmp180;
    if (__min1___0 < __min2___0) {
      tmp___10 = __min1___0;
    } else {
      tmp___10 = __min2___0;
    }
    {
    *data_size = tmp___10;
    __len___3 = *data_size;
    __cil_tmp181 = (unsigned long )(& gsmi_dev) + 16;
    __cil_tmp182 = *((struct gsmi_buf **)__cil_tmp181);
    __cil_tmp183 = *((u8 **)__cil_tmp182);
    __cil_tmp184 = (void const *)__cil_tmp183;
    __ret___3 = memmove(data, __cil_tmp184, __len___3);
    *attr = (u32 )7;
    }
  }
  {
  __cil_tmp185 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp186 = (spinlock_t *)__cil_tmp185;
  spin_unlock_irqrestore(__cil_tmp186, flags);
  }
  return (ret);
}
}
static efi_status_t gsmi_get_next_variable(unsigned long *name_size , efi_char16_t *name ,
                                           efi_guid_t *vendor )
{ struct gsmi_get_next_var_param param ;
  efi_status_t ret ;
  int rc ;
  unsigned long flags ;
  size_t tmp___7 ;
  raw_spinlock_t *tmp___8 ;
  size_t __len ;
  void *__ret ;
  size_t __len___0 ;
  void *__ret___0 ;
  size_t __len___1 ;
  void *__ret___1 ;
  size_t __len___2 ;
  void *__ret___2 ;
  size_t __len___3 ;
  void *__ret___3 ;
  size_t tmp___9 ;
  size_t __len___4 ;
  void *__ret___4 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  unsigned long __cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  unsigned long __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  unsigned long __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  struct gsmi_buf *__cil_tmp75 ;
  unsigned long __cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  unsigned long __cil_tmp79 ;
  struct gsmi_buf *__cil_tmp80 ;
  unsigned long __cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  size_t __cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  spinlock_t *__cil_tmp88 ;
  struct gsmi_get_next_var_param *__cil_tmp89 ;
  u8 (*__cil_tmp90)[16] ;
  void *__cil_tmp91 ;
  void const *__cil_tmp92 ;
  struct gsmi_get_next_var_param *__cil_tmp93 ;
  u8 (*__cil_tmp94)[16] ;
  void *__cil_tmp95 ;
  void const *__cil_tmp96 ;
  unsigned long __cil_tmp97 ;
  struct gsmi_buf *__cil_tmp98 ;
  u8 *__cil_tmp99 ;
  void *__cil_tmp100 ;
  void const *__cil_tmp101 ;
  unsigned long __cil_tmp102 ;
  struct gsmi_buf *__cil_tmp103 ;
  u8 *__cil_tmp104 ;
  void *__cil_tmp105 ;
  unsigned long __cil_tmp106 ;
  struct gsmi_buf *__cil_tmp107 ;
  unsigned long __cil_tmp108 ;
  unsigned long __cil_tmp109 ;
  size_t __cil_tmp110 ;
  unsigned long __cil_tmp111 ;
  struct gsmi_buf *__cil_tmp112 ;
  u8 *__cil_tmp113 ;
  void *__cil_tmp114 ;
  void const *__cil_tmp115 ;
  unsigned long __cil_tmp116 ;
  struct gsmi_buf *__cil_tmp117 ;
  u8 *__cil_tmp118 ;
  void *__cil_tmp119 ;
  void const *__cil_tmp120 ;
  u8 __cil_tmp121 ;
  u8 __cil_tmp122 ;
  unsigned long __cil_tmp123 ;
  unsigned long __cil_tmp124 ;
  void *__cil_tmp125 ;
  unsigned long __cil_tmp126 ;
  struct gsmi_buf *__cil_tmp127 ;
  u8 *__cil_tmp128 ;
  void const *__cil_tmp129 ;
  void *__cil_tmp130 ;
  unsigned long __cil_tmp131 ;
  struct gsmi_buf *__cil_tmp132 ;
  u8 *__cil_tmp133 ;
  void const *__cil_tmp134 ;
  void *__cil_tmp135 ;
  unsigned long __cil_tmp136 ;
  struct gsmi_buf *__cil_tmp137 ;
  u8 *__cil_tmp138 ;
  void const *__cil_tmp139 ;
  void *__cil_tmp140 ;
  unsigned long __cil_tmp141 ;
  struct gsmi_buf *__cil_tmp142 ;
  u8 *__cil_tmp143 ;
  void const *__cil_tmp144 ;
  void *__cil_tmp145 ;
  struct gsmi_get_next_var_param *__cil_tmp146 ;
  u8 (*__cil_tmp147)[16] ;
  void const *__cil_tmp148 ;
  void *__cil_tmp149 ;
  struct gsmi_get_next_var_param *__cil_tmp150 ;
  u8 (*__cil_tmp151)[16] ;
  void const *__cil_tmp152 ;
  unsigned long __cil_tmp153 ;
  spinlock_t *__cil_tmp154 ;
  {
  __cil_tmp25 = 0 * 1UL;
  __cil_tmp26 = 0 + __cil_tmp25;
  __cil_tmp27 = (unsigned long )(& param) + __cil_tmp26;
  *((u8 *)__cil_tmp27) = (unsigned char)0;
  __cil_tmp28 = 1 * 1UL;
  __cil_tmp29 = 0 + __cil_tmp28;
  __cil_tmp30 = (unsigned long )(& param) + __cil_tmp29;
  *((u8 *)__cil_tmp30) = (unsigned char)0;
  __cil_tmp31 = 2 * 1UL;
  __cil_tmp32 = 0 + __cil_tmp31;
  __cil_tmp33 = (unsigned long )(& param) + __cil_tmp32;
  *((u8 *)__cil_tmp33) = (unsigned char)0;
  __cil_tmp34 = 3 * 1UL;
  __cil_tmp35 = 0 + __cil_tmp34;
  __cil_tmp36 = (unsigned long )(& param) + __cil_tmp35;
  *((u8 *)__cil_tmp36) = (unsigned char)0;
  __cil_tmp37 = 4 * 1UL;
  __cil_tmp38 = 0 + __cil_tmp37;
  __cil_tmp39 = (unsigned long )(& param) + __cil_tmp38;
  *((u8 *)__cil_tmp39) = (unsigned char)0;
  __cil_tmp40 = 5 * 1UL;
  __cil_tmp41 = 0 + __cil_tmp40;
  __cil_tmp42 = (unsigned long )(& param) + __cil_tmp41;
  *((u8 *)__cil_tmp42) = (unsigned char)0;
  __cil_tmp43 = 6 * 1UL;
  __cil_tmp44 = 0 + __cil_tmp43;
  __cil_tmp45 = (unsigned long )(& param) + __cil_tmp44;
  *((u8 *)__cil_tmp45) = (unsigned char)0;
  __cil_tmp46 = 7 * 1UL;
  __cil_tmp47 = 0 + __cil_tmp46;
  __cil_tmp48 = (unsigned long )(& param) + __cil_tmp47;
  *((u8 *)__cil_tmp48) = (unsigned char)0;
  __cil_tmp49 = 8 * 1UL;
  __cil_tmp50 = 0 + __cil_tmp49;
  __cil_tmp51 = (unsigned long )(& param) + __cil_tmp50;
  *((u8 *)__cil_tmp51) = (unsigned char)0;
  __cil_tmp52 = 9 * 1UL;
  __cil_tmp53 = 0 + __cil_tmp52;
  __cil_tmp54 = (unsigned long )(& param) + __cil_tmp53;
  *((u8 *)__cil_tmp54) = (unsigned char)0;
  __cil_tmp55 = 10 * 1UL;
  __cil_tmp56 = 0 + __cil_tmp55;
  __cil_tmp57 = (unsigned long )(& param) + __cil_tmp56;
  *((u8 *)__cil_tmp57) = (unsigned char)0;
  __cil_tmp58 = 11 * 1UL;
  __cil_tmp59 = 0 + __cil_tmp58;
  __cil_tmp60 = (unsigned long )(& param) + __cil_tmp59;
  *((u8 *)__cil_tmp60) = (unsigned char)0;
  __cil_tmp61 = 12 * 1UL;
  __cil_tmp62 = 0 + __cil_tmp61;
  __cil_tmp63 = (unsigned long )(& param) + __cil_tmp62;
  *((u8 *)__cil_tmp63) = (unsigned char)0;
  __cil_tmp64 = 13 * 1UL;
  __cil_tmp65 = 0 + __cil_tmp64;
  __cil_tmp66 = (unsigned long )(& param) + __cil_tmp65;
  *((u8 *)__cil_tmp66) = (unsigned char)0;
  __cil_tmp67 = 14 * 1UL;
  __cil_tmp68 = 0 + __cil_tmp67;
  __cil_tmp69 = (unsigned long )(& param) + __cil_tmp68;
  *((u8 *)__cil_tmp69) = (unsigned char)0;
  __cil_tmp70 = 15 * 1UL;
  __cil_tmp71 = 0 + __cil_tmp70;
  __cil_tmp72 = (unsigned long )(& param) + __cil_tmp71;
  *((u8 *)__cil_tmp72) = (unsigned char)0;
  __cil_tmp73 = (unsigned long )(& param) + 16;
  __cil_tmp74 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp75 = *((struct gsmi_buf **)__cil_tmp74);
  __cil_tmp76 = (unsigned long )__cil_tmp75;
  __cil_tmp77 = __cil_tmp76 + 24;
  *((u32 *)__cil_tmp73) = *((u32 *)__cil_tmp77);
  __cil_tmp78 = (unsigned long )(& param) + 20;
  __cil_tmp79 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp80 = *((struct gsmi_buf **)__cil_tmp79);
  __cil_tmp81 = (unsigned long )__cil_tmp80;
  __cil_tmp82 = __cil_tmp81 + 8;
  __cil_tmp83 = *((size_t *)__cil_tmp82);
  *((u32 *)__cil_tmp78) = (u32 )__cil_tmp83;
  ret = (efi_status_t )0;
  {
  __cil_tmp84 = *name_size;
  if (__cil_tmp84 != 1024UL) {
    {
    __cil_tmp85 = 1UL << 63;
    return (4UL | __cil_tmp85);
    }
  } else {
  }
  }
  {
  tmp___7 = utf16_strlen(name, 512UL);
  }
  if (tmp___7 == 512UL) {
    {
    __cil_tmp86 = 1UL << 63;
    return (2UL | __cil_tmp86);
    }
  } else {
  }
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp87 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp88 = (spinlock_t *)__cil_tmp87;
      tmp___8 = spinlock_check(__cil_tmp88);
      flags = _raw_spin_lock_irqsave(tmp___8);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  __len = 16UL;
  if (__len >= 64UL) {
    {
    __cil_tmp89 = & param;
    __cil_tmp90 = (u8 (*)[16])__cil_tmp89;
    __cil_tmp91 = (void *)__cil_tmp90;
    __cil_tmp92 = (void const *)vendor;
    __ret = memmove(__cil_tmp91, __cil_tmp92, __len);
    }
  } else {
    {
    __cil_tmp93 = & param;
    __cil_tmp94 = (u8 (*)[16])__cil_tmp93;
    __cil_tmp95 = (void *)__cil_tmp94;
    __cil_tmp96 = (void const *)vendor;
    __ret = memmove(__cil_tmp95, __cil_tmp96, __len);
    }
  }
  {
  __len___0 = *name_size;
  __cil_tmp97 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp98 = *((struct gsmi_buf **)__cil_tmp97);
  __cil_tmp99 = *((u8 **)__cil_tmp98);
  __cil_tmp100 = (void *)__cil_tmp99;
  __cil_tmp101 = (void const *)name;
  __ret___0 = memmove(__cil_tmp100, __cil_tmp101, __len___0);
  __cil_tmp102 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp103 = *((struct gsmi_buf **)__cil_tmp102);
  __cil_tmp104 = *((u8 **)__cil_tmp103);
  __cil_tmp105 = (void *)__cil_tmp104;
  __cil_tmp106 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp107 = *((struct gsmi_buf **)__cil_tmp106);
  __cil_tmp108 = (unsigned long )__cil_tmp107;
  __cil_tmp109 = __cil_tmp108 + 8;
  __cil_tmp110 = *((size_t *)__cil_tmp109);
  memset(__cil_tmp105, 0, __cil_tmp110);
  __len___1 = 24UL;
  }
  if (__len___1 >= 64UL) {
    {
    __cil_tmp111 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp112 = *((struct gsmi_buf **)__cil_tmp111);
    __cil_tmp113 = *((u8 **)__cil_tmp112);
    __cil_tmp114 = (void *)__cil_tmp113;
    __cil_tmp115 = (void const *)(& param);
    __ret___1 = memmove(__cil_tmp114, __cil_tmp115, __len___1);
    }
  } else {
    {
    __cil_tmp116 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp117 = *((struct gsmi_buf **)__cil_tmp116);
    __cil_tmp118 = *((u8 **)__cil_tmp117);
    __cil_tmp119 = (void *)__cil_tmp118;
    __cil_tmp120 = (void const *)(& param);
    __ret___1 = memmove(__cil_tmp119, __cil_tmp120, __len___1);
    }
  }
  {
  __cil_tmp121 = (u8 )239;
  __cil_tmp122 = (u8 )2;
  rc = gsmi_exec(__cil_tmp121, __cil_tmp122);
  }
  if (rc < 0) {
    {
    printk("<3>gsmi: Get Next Variable Name failed\n");
    __cil_tmp123 = 1UL << 63;
    ret = 1UL | __cil_tmp123;
    }
  } else
  if (rc == 1) {
    __cil_tmp124 = 1UL << 63;
    ret = 14UL | __cil_tmp124;
  } else {
    __len___2 = 24UL;
    if (__len___2 >= 64UL) {
      {
      __cil_tmp125 = (void *)(& param);
      __cil_tmp126 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp127 = *((struct gsmi_buf **)__cil_tmp126);
      __cil_tmp128 = *((u8 **)__cil_tmp127);
      __cil_tmp129 = (void const *)__cil_tmp128;
      __ret___2 = memmove(__cil_tmp125, __cil_tmp129, __len___2);
      }
    } else {
      {
      __cil_tmp130 = (void *)(& param);
      __cil_tmp131 = (unsigned long )(& gsmi_dev) + 24;
      __cil_tmp132 = *((struct gsmi_buf **)__cil_tmp131);
      __cil_tmp133 = *((u8 **)__cil_tmp132);
      __cil_tmp134 = (void const *)__cil_tmp133;
      __ret___2 = memmove(__cil_tmp130, __cil_tmp134, __len___2);
      }
    }
    __len___3 = (size_t )1024;
    if (__len___3 >= 64UL) {
      {
      __cil_tmp135 = (void *)name;
      __cil_tmp136 = (unsigned long )(& gsmi_dev) + 8;
      __cil_tmp137 = *((struct gsmi_buf **)__cil_tmp136);
      __cil_tmp138 = *((u8 **)__cil_tmp137);
      __cil_tmp139 = (void const *)__cil_tmp138;
      __ret___3 = memmove(__cil_tmp135, __cil_tmp139, __len___3);
      }
    } else {
      {
      __cil_tmp140 = (void *)name;
      __cil_tmp141 = (unsigned long )(& gsmi_dev) + 8;
      __cil_tmp142 = *((struct gsmi_buf **)__cil_tmp141);
      __cil_tmp143 = *((u8 **)__cil_tmp142);
      __cil_tmp144 = (void const *)__cil_tmp143;
      __ret___3 = memmove(__cil_tmp140, __cil_tmp144, __len___3);
      }
    }
    {
    tmp___9 = utf16_strlen(name, 512UL);
    *name_size = tmp___9 * 2UL;
    __len___4 = 16UL;
    }
    if (__len___4 >= 64UL) {
      {
      __cil_tmp145 = (void *)vendor;
      __cil_tmp146 = & param;
      __cil_tmp147 = (u8 (*)[16])__cil_tmp146;
      __cil_tmp148 = (void const *)__cil_tmp147;
      __ret___4 = memmove(__cil_tmp145, __cil_tmp148, __len___4);
      }
    } else {
      {
      __cil_tmp149 = (void *)vendor;
      __cil_tmp150 = & param;
      __cil_tmp151 = (u8 (*)[16])__cil_tmp150;
      __cil_tmp152 = (void const *)__cil_tmp151;
      __ret___4 = memmove(__cil_tmp149, __cil_tmp152, __len___4);
      }
    }
    ret = (efi_status_t )0;
  }
  {
  __cil_tmp153 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp154 = (spinlock_t *)__cil_tmp153;
  spin_unlock_irqrestore(__cil_tmp154, flags);
  }
  return (ret);
}
}
static efi_status_t gsmi_set_variable(efi_char16_t *name , efi_guid_t *vendor , u32 attr ,
                                      unsigned long data_size , void *data )
{ struct gsmi_nvram_var_param param ;
  size_t name_len ;
  size_t tmp___7 ;
  efi_status_t ret ;
  int rc ;
  unsigned long flags ;
  raw_spinlock_t *tmp___8 ;
  size_t __len ;
  void *__ret ;
  size_t __len___0 ;
  void *__ret___0 ;
  size_t __len___1 ;
  void *__ret___1 ;
  size_t __len___2 ;
  void *__ret___2 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  unsigned long __cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  unsigned long __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  unsigned long __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  unsigned long __cil_tmp75 ;
  unsigned long __cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  unsigned long __cil_tmp79 ;
  unsigned long __cil_tmp80 ;
  unsigned long __cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  unsigned long __cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  struct gsmi_buf *__cil_tmp89 ;
  unsigned long __cil_tmp90 ;
  unsigned long __cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  unsigned long __cil_tmp94 ;
  unsigned long __cil_tmp95 ;
  struct gsmi_buf *__cil_tmp96 ;
  unsigned long __cil_tmp97 ;
  unsigned long __cil_tmp98 ;
  unsigned long __cil_tmp99 ;
  unsigned long __cil_tmp100 ;
  spinlock_t *__cil_tmp101 ;
  struct gsmi_nvram_var_param *__cil_tmp102 ;
  efi_guid_t *__cil_tmp103 ;
  void *__cil_tmp104 ;
  void const *__cil_tmp105 ;
  struct gsmi_nvram_var_param *__cil_tmp106 ;
  efi_guid_t *__cil_tmp107 ;
  void *__cil_tmp108 ;
  void const *__cil_tmp109 ;
  unsigned long __cil_tmp110 ;
  struct gsmi_buf *__cil_tmp111 ;
  u8 *__cil_tmp112 ;
  void *__cil_tmp113 ;
  unsigned long __cil_tmp114 ;
  struct gsmi_buf *__cil_tmp115 ;
  unsigned long __cil_tmp116 ;
  unsigned long __cil_tmp117 ;
  size_t __cil_tmp118 ;
  unsigned long __cil_tmp119 ;
  struct gsmi_buf *__cil_tmp120 ;
  u8 *__cil_tmp121 ;
  void *__cil_tmp122 ;
  void const *__cil_tmp123 ;
  unsigned long __cil_tmp124 ;
  struct gsmi_buf *__cil_tmp125 ;
  u8 *__cil_tmp126 ;
  void *__cil_tmp127 ;
  unsigned long __cil_tmp128 ;
  struct gsmi_buf *__cil_tmp129 ;
  unsigned long __cil_tmp130 ;
  unsigned long __cil_tmp131 ;
  size_t __cil_tmp132 ;
  unsigned long __cil_tmp133 ;
  struct gsmi_buf *__cil_tmp134 ;
  u8 *__cil_tmp135 ;
  void *__cil_tmp136 ;
  void const *__cil_tmp137 ;
  unsigned long __cil_tmp138 ;
  struct gsmi_buf *__cil_tmp139 ;
  u8 *__cil_tmp140 ;
  void *__cil_tmp141 ;
  unsigned long __cil_tmp142 ;
  struct gsmi_buf *__cil_tmp143 ;
  unsigned long __cil_tmp144 ;
  unsigned long __cil_tmp145 ;
  size_t __cil_tmp146 ;
  unsigned long __cil_tmp147 ;
  struct gsmi_buf *__cil_tmp148 ;
  u8 *__cil_tmp149 ;
  void *__cil_tmp150 ;
  void const *__cil_tmp151 ;
  unsigned long __cil_tmp152 ;
  struct gsmi_buf *__cil_tmp153 ;
  u8 *__cil_tmp154 ;
  void *__cil_tmp155 ;
  void const *__cil_tmp156 ;
  u8 __cil_tmp157 ;
  u8 __cil_tmp158 ;
  unsigned long __cil_tmp159 ;
  unsigned long __cil_tmp160 ;
  spinlock_t *__cil_tmp161 ;
  {
  {
  __cil_tmp23 = 0 * 1UL;
  __cil_tmp24 = 0 + __cil_tmp23;
  __cil_tmp25 = 0 + __cil_tmp24;
  __cil_tmp26 = (unsigned long )(& param) + __cil_tmp25;
  *((u8 *)__cil_tmp26) = (unsigned char)0;
  __cil_tmp27 = 1 * 1UL;
  __cil_tmp28 = 0 + __cil_tmp27;
  __cil_tmp29 = 0 + __cil_tmp28;
  __cil_tmp30 = (unsigned long )(& param) + __cil_tmp29;
  *((u8 *)__cil_tmp30) = (unsigned char)0;
  __cil_tmp31 = 2 * 1UL;
  __cil_tmp32 = 0 + __cil_tmp31;
  __cil_tmp33 = 0 + __cil_tmp32;
  __cil_tmp34 = (unsigned long )(& param) + __cil_tmp33;
  *((u8 *)__cil_tmp34) = (unsigned char)0;
  __cil_tmp35 = 3 * 1UL;
  __cil_tmp36 = 0 + __cil_tmp35;
  __cil_tmp37 = 0 + __cil_tmp36;
  __cil_tmp38 = (unsigned long )(& param) + __cil_tmp37;
  *((u8 *)__cil_tmp38) = (unsigned char)0;
  __cil_tmp39 = 4 * 1UL;
  __cil_tmp40 = 0 + __cil_tmp39;
  __cil_tmp41 = 0 + __cil_tmp40;
  __cil_tmp42 = (unsigned long )(& param) + __cil_tmp41;
  *((u8 *)__cil_tmp42) = (unsigned char)0;
  __cil_tmp43 = 5 * 1UL;
  __cil_tmp44 = 0 + __cil_tmp43;
  __cil_tmp45 = 0 + __cil_tmp44;
  __cil_tmp46 = (unsigned long )(& param) + __cil_tmp45;
  *((u8 *)__cil_tmp46) = (unsigned char)0;
  __cil_tmp47 = 6 * 1UL;
  __cil_tmp48 = 0 + __cil_tmp47;
  __cil_tmp49 = 0 + __cil_tmp48;
  __cil_tmp50 = (unsigned long )(& param) + __cil_tmp49;
  *((u8 *)__cil_tmp50) = (unsigned char)0;
  __cil_tmp51 = 7 * 1UL;
  __cil_tmp52 = 0 + __cil_tmp51;
  __cil_tmp53 = 0 + __cil_tmp52;
  __cil_tmp54 = (unsigned long )(& param) + __cil_tmp53;
  *((u8 *)__cil_tmp54) = (unsigned char)0;
  __cil_tmp55 = 8 * 1UL;
  __cil_tmp56 = 0 + __cil_tmp55;
  __cil_tmp57 = 0 + __cil_tmp56;
  __cil_tmp58 = (unsigned long )(& param) + __cil_tmp57;
  *((u8 *)__cil_tmp58) = (unsigned char)0;
  __cil_tmp59 = 9 * 1UL;
  __cil_tmp60 = 0 + __cil_tmp59;
  __cil_tmp61 = 0 + __cil_tmp60;
  __cil_tmp62 = (unsigned long )(& param) + __cil_tmp61;
  *((u8 *)__cil_tmp62) = (unsigned char)0;
  __cil_tmp63 = 10 * 1UL;
  __cil_tmp64 = 0 + __cil_tmp63;
  __cil_tmp65 = 0 + __cil_tmp64;
  __cil_tmp66 = (unsigned long )(& param) + __cil_tmp65;
  *((u8 *)__cil_tmp66) = (unsigned char)0;
  __cil_tmp67 = 11 * 1UL;
  __cil_tmp68 = 0 + __cil_tmp67;
  __cil_tmp69 = 0 + __cil_tmp68;
  __cil_tmp70 = (unsigned long )(& param) + __cil_tmp69;
  *((u8 *)__cil_tmp70) = (unsigned char)0;
  __cil_tmp71 = 12 * 1UL;
  __cil_tmp72 = 0 + __cil_tmp71;
  __cil_tmp73 = 0 + __cil_tmp72;
  __cil_tmp74 = (unsigned long )(& param) + __cil_tmp73;
  *((u8 *)__cil_tmp74) = (unsigned char)0;
  __cil_tmp75 = 13 * 1UL;
  __cil_tmp76 = 0 + __cil_tmp75;
  __cil_tmp77 = 0 + __cil_tmp76;
  __cil_tmp78 = (unsigned long )(& param) + __cil_tmp77;
  *((u8 *)__cil_tmp78) = (unsigned char)0;
  __cil_tmp79 = 14 * 1UL;
  __cil_tmp80 = 0 + __cil_tmp79;
  __cil_tmp81 = 0 + __cil_tmp80;
  __cil_tmp82 = (unsigned long )(& param) + __cil_tmp81;
  *((u8 *)__cil_tmp82) = (unsigned char)0;
  __cil_tmp83 = 15 * 1UL;
  __cil_tmp84 = 0 + __cil_tmp83;
  __cil_tmp85 = 0 + __cil_tmp84;
  __cil_tmp86 = (unsigned long )(& param) + __cil_tmp85;
  *((u8 *)__cil_tmp86) = (unsigned char)0;
  __cil_tmp87 = (unsigned long )(& param) + 16;
  __cil_tmp88 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp89 = *((struct gsmi_buf **)__cil_tmp88);
  __cil_tmp90 = (unsigned long )__cil_tmp89;
  __cil_tmp91 = __cil_tmp90 + 24;
  *((u32 *)__cil_tmp87) = *((u32 *)__cil_tmp91);
  __cil_tmp92 = (unsigned long )(& param) + 20;
  *((u32 *)__cil_tmp92) = (u32 )7;
  __cil_tmp93 = (unsigned long )(& param) + 24;
  *((u32 *)__cil_tmp93) = (u32 )data_size;
  __cil_tmp94 = (unsigned long )(& param) + 28;
  __cil_tmp95 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp96 = *((struct gsmi_buf **)__cil_tmp95);
  __cil_tmp97 = (unsigned long )__cil_tmp96;
  __cil_tmp98 = __cil_tmp97 + 24;
  *((u32 *)__cil_tmp94) = *((u32 *)__cil_tmp98);
  tmp___7 = utf16_strlen(name, 512UL);
  name_len = tmp___7;
  ret = (efi_status_t )0;
  }
  if (name_len >= 512UL) {
    {
    __cil_tmp99 = 1UL << 63;
    return (4UL | __cil_tmp99);
    }
  } else {
  }
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp100 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp101 = (spinlock_t *)__cil_tmp100;
      tmp___8 = spinlock_check(__cil_tmp101);
      flags = _raw_spin_lock_irqsave(tmp___8);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  __len = 16UL;
  if (__len >= 64UL) {
    {
    __cil_tmp102 = & param;
    __cil_tmp103 = (efi_guid_t *)__cil_tmp102;
    __cil_tmp104 = (void *)__cil_tmp103;
    __cil_tmp105 = (void const *)vendor;
    __ret = memmove(__cil_tmp104, __cil_tmp105, __len);
    }
  } else {
    {
    __cil_tmp106 = & param;
    __cil_tmp107 = (efi_guid_t *)__cil_tmp106;
    __cil_tmp108 = (void *)__cil_tmp107;
    __cil_tmp109 = (void const *)vendor;
    __ret = memmove(__cil_tmp108, __cil_tmp109, __len);
    }
  }
  {
  __cil_tmp110 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp111 = *((struct gsmi_buf **)__cil_tmp110);
  __cil_tmp112 = *((u8 **)__cil_tmp111);
  __cil_tmp113 = (void *)__cil_tmp112;
  __cil_tmp114 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp115 = *((struct gsmi_buf **)__cil_tmp114);
  __cil_tmp116 = (unsigned long )__cil_tmp115;
  __cil_tmp117 = __cil_tmp116 + 8;
  __cil_tmp118 = *((size_t *)__cil_tmp117);
  memset(__cil_tmp113, 0, __cil_tmp118);
  __len___0 = name_len * 2UL;
  __cil_tmp119 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp120 = *((struct gsmi_buf **)__cil_tmp119);
  __cil_tmp121 = *((u8 **)__cil_tmp120);
  __cil_tmp122 = (void *)__cil_tmp121;
  __cil_tmp123 = (void const *)name;
  __ret___0 = memmove(__cil_tmp122, __cil_tmp123, __len___0);
  __cil_tmp124 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp125 = *((struct gsmi_buf **)__cil_tmp124);
  __cil_tmp126 = *((u8 **)__cil_tmp125);
  __cil_tmp127 = (void *)__cil_tmp126;
  __cil_tmp128 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp129 = *((struct gsmi_buf **)__cil_tmp128);
  __cil_tmp130 = (unsigned long )__cil_tmp129;
  __cil_tmp131 = __cil_tmp130 + 8;
  __cil_tmp132 = *((size_t *)__cil_tmp131);
  memset(__cil_tmp127, 0, __cil_tmp132);
  __len___1 = data_size;
  __cil_tmp133 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp134 = *((struct gsmi_buf **)__cil_tmp133);
  __cil_tmp135 = *((u8 **)__cil_tmp134);
  __cil_tmp136 = (void *)__cil_tmp135;
  __cil_tmp137 = (void const *)data;
  __ret___1 = memmove(__cil_tmp136, __cil_tmp137, __len___1);
  __cil_tmp138 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp139 = *((struct gsmi_buf **)__cil_tmp138);
  __cil_tmp140 = *((u8 **)__cil_tmp139);
  __cil_tmp141 = (void *)__cil_tmp140;
  __cil_tmp142 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp143 = *((struct gsmi_buf **)__cil_tmp142);
  __cil_tmp144 = (unsigned long )__cil_tmp143;
  __cil_tmp145 = __cil_tmp144 + 8;
  __cil_tmp146 = *((size_t *)__cil_tmp145);
  memset(__cil_tmp141, 0, __cil_tmp146);
  __len___2 = 32UL;
  }
  if (__len___2 >= 64UL) {
    {
    __cil_tmp147 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp148 = *((struct gsmi_buf **)__cil_tmp147);
    __cil_tmp149 = *((u8 **)__cil_tmp148);
    __cil_tmp150 = (void *)__cil_tmp149;
    __cil_tmp151 = (void const *)(& param);
    __ret___2 = memmove(__cil_tmp150, __cil_tmp151, __len___2);
    }
  } else {
    {
    __cil_tmp152 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp153 = *((struct gsmi_buf **)__cil_tmp152);
    __cil_tmp154 = *((u8 **)__cil_tmp153);
    __cil_tmp155 = (void *)__cil_tmp154;
    __cil_tmp156 = (void const *)(& param);
    __ret___2 = memmove(__cil_tmp155, __cil_tmp156, __len___2);
    }
  }
  {
  __cil_tmp157 = (u8 )239;
  __cil_tmp158 = (u8 )3;
  rc = gsmi_exec(__cil_tmp157, __cil_tmp158);
  }
  if (rc < 0) {
    {
    printk("<3>gsmi: Set Variable failed\n");
    __cil_tmp159 = 1UL << 63;
    ret = 2UL | __cil_tmp159;
    }
  } else {
  }
  {
  __cil_tmp160 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp161 = (spinlock_t *)__cil_tmp160;
  spin_unlock_irqrestore(__cil_tmp161, flags);
  }
  return (ret);
}
}
static struct efivar_operations const efivar_ops = {& gsmi_get_variable, & gsmi_get_next_variable, & gsmi_set_variable};
static ssize_t eventlog_write(struct file *filp , struct kobject *kobj , struct bin_attribute *bin_attr ,
                              char *buf , loff_t pos , size_t count )
{ struct gsmi_set_eventlog_param param ;
  int rc ;
  unsigned long flags ;
  raw_spinlock_t *tmp___7 ;
  size_t __len ;
  void *__ret ;
  size_t __len___0 ;
  void *__ret___0 ;
  struct gsmi_set_eventlog_param *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  struct gsmi_buf *__cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  u32 *__cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct gsmi_buf *__cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  size_t __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  size_t __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  spinlock_t *__cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  struct gsmi_buf *__cil_tmp36 ;
  u8 *__cil_tmp37 ;
  void *__cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  struct gsmi_buf *__cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  size_t __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  u32 __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  struct gsmi_buf *__cil_tmp47 ;
  u8 *__cil_tmp48 ;
  void *__cil_tmp49 ;
  void const *__cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  struct gsmi_buf *__cil_tmp52 ;
  u8 *__cil_tmp53 ;
  void *__cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  struct gsmi_buf *__cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  size_t __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  struct gsmi_buf *__cil_tmp61 ;
  u8 *__cil_tmp62 ;
  void *__cil_tmp63 ;
  void const *__cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  struct gsmi_buf *__cil_tmp66 ;
  u8 *__cil_tmp67 ;
  void *__cil_tmp68 ;
  void const *__cil_tmp69 ;
  u8 __cil_tmp70 ;
  u8 __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  spinlock_t *__cil_tmp73 ;
  {
  __cil_tmp17 = & param;
  __cil_tmp18 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp19 = *((struct gsmi_buf **)__cil_tmp18);
  __cil_tmp20 = (unsigned long )__cil_tmp19;
  __cil_tmp21 = __cil_tmp20 + 24;
  *((u32 *)__cil_tmp17) = *((u32 *)__cil_tmp21);
  __cil_tmp22 = (unsigned long )(& param) + 4;
  *((u32 *)__cil_tmp22) = 0U;
  __cil_tmp23 = (unsigned long )(& param) + 8;
  *((u32 *)__cil_tmp23) = 0U;
  rc = 0;
  if (count < 4UL) {
    return ((ssize_t )-22);
  } else {
  }
  __cil_tmp24 = (unsigned long )(& param) + 8;
  __cil_tmp25 = (u32 *)buf;
  *((u32 *)__cil_tmp24) = *__cil_tmp25;
  count = count - 4UL;
  buf = buf + 4UL;
  {
  __cil_tmp26 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp27 = *((struct gsmi_buf **)__cil_tmp26);
  __cil_tmp28 = (unsigned long )__cil_tmp27;
  __cil_tmp29 = __cil_tmp28 + 8;
  __cil_tmp30 = *((size_t *)__cil_tmp29);
  if (count > __cil_tmp30) {
    return ((ssize_t )-22);
  } else {
  }
  }
  __cil_tmp31 = (unsigned long )(& param) + 4;
  __cil_tmp32 = count - 4UL;
  *((u32 *)__cil_tmp31) = (u32 )__cil_tmp32;
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp33 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp34 = (spinlock_t *)__cil_tmp33;
      tmp___7 = spinlock_check(__cil_tmp34);
      flags = _raw_spin_lock_irqsave(tmp___7);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  {
  __cil_tmp35 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp36 = *((struct gsmi_buf **)__cil_tmp35);
  __cil_tmp37 = *((u8 **)__cil_tmp36);
  __cil_tmp38 = (void *)__cil_tmp37;
  __cil_tmp39 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp40 = *((struct gsmi_buf **)__cil_tmp39);
  __cil_tmp41 = (unsigned long )__cil_tmp40;
  __cil_tmp42 = __cil_tmp41 + 8;
  __cil_tmp43 = *((size_t *)__cil_tmp42);
  memset(__cil_tmp38, 0, __cil_tmp43);
  __cil_tmp44 = (unsigned long )(& param) + 4;
  __cil_tmp45 = *((u32 *)__cil_tmp44);
  __len = (size_t )__cil_tmp45;
  __cil_tmp46 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp47 = *((struct gsmi_buf **)__cil_tmp46);
  __cil_tmp48 = *((u8 **)__cil_tmp47);
  __cil_tmp49 = (void *)__cil_tmp48;
  __cil_tmp50 = (void const *)buf;
  __ret = memmove(__cil_tmp49, __cil_tmp50, __len);
  __cil_tmp51 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp52 = *((struct gsmi_buf **)__cil_tmp51);
  __cil_tmp53 = *((u8 **)__cil_tmp52);
  __cil_tmp54 = (void *)__cil_tmp53;
  __cil_tmp55 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp56 = *((struct gsmi_buf **)__cil_tmp55);
  __cil_tmp57 = (unsigned long )__cil_tmp56;
  __cil_tmp58 = __cil_tmp57 + 8;
  __cil_tmp59 = *((size_t *)__cil_tmp58);
  memset(__cil_tmp54, 0, __cil_tmp59);
  __len___0 = 12UL;
  }
  if (__len___0 >= 64UL) {
    {
    __cil_tmp60 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp61 = *((struct gsmi_buf **)__cil_tmp60);
    __cil_tmp62 = *((u8 **)__cil_tmp61);
    __cil_tmp63 = (void *)__cil_tmp62;
    __cil_tmp64 = (void const *)(& param);
    __ret___0 = memmove(__cil_tmp63, __cil_tmp64, __len___0);
    }
  } else {
    {
    __cil_tmp65 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp66 = *((struct gsmi_buf **)__cil_tmp65);
    __cil_tmp67 = *((u8 **)__cil_tmp66);
    __cil_tmp68 = (void *)__cil_tmp67;
    __cil_tmp69 = (void const *)(& param);
    __ret___0 = memmove(__cil_tmp68, __cil_tmp69, __len___0);
    }
  }
  {
  __cil_tmp70 = (u8 )239;
  __cil_tmp71 = (u8 )8;
  rc = gsmi_exec(__cil_tmp70, __cil_tmp71);
  }
  if (rc < 0) {
    {
    printk("<3>gsmi: Set Event Log failed\n");
    }
  } else {
  }
  {
  __cil_tmp72 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp73 = (spinlock_t *)__cil_tmp72;
  spin_unlock_irqrestore(__cil_tmp73, flags);
  }
  return ((ssize_t )rc);
}
}
static struct bin_attribute eventlog_bin_attr = {{"append_to_eventlog", (umode_t )128}, 0UL, (void *)0, (ssize_t (*)(struct file * ,
                                                                        struct kobject * ,
                                                                        struct bin_attribute * ,
                                                                        char * , loff_t ,
                                                                        size_t ))0,
    & eventlog_write, (int (*)(struct file * , struct kobject * , struct bin_attribute *attr ,
                               struct vm_area_struct *vma ))0};
static ssize_t gsmi_clear_eventlog_store(struct kobject *kobj , struct kobj_attribute *attr ,
                                         char const *buf , size_t count )
{ int rc ;
  unsigned long flags ;
  unsigned long val ;
  struct __anonstruct_param_288 param ;
  raw_spinlock_t *tmp___7 ;
  size_t __len ;
  void *__ret ;
  unsigned long *__cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  struct __anonstruct_param_288 *__cil_tmp16 ;
  unsigned long *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  spinlock_t *__cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  struct gsmi_buf *__cil_tmp23 ;
  u8 *__cil_tmp24 ;
  void *__cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct gsmi_buf *__cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  size_t __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  struct gsmi_buf *__cil_tmp32 ;
  u8 *__cil_tmp33 ;
  void *__cil_tmp34 ;
  void const *__cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  struct gsmi_buf *__cil_tmp37 ;
  u8 *__cil_tmp38 ;
  void *__cil_tmp39 ;
  void const *__cil_tmp40 ;
  u8 __cil_tmp41 ;
  u8 __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  spinlock_t *__cil_tmp44 ;
  {
  {
  rc = (int )kstrtoul(buf, 0U, & val);
  }
  if (rc) {
    return ((ssize_t )rc);
  } else {
  }
  {
  __cil_tmp14 = & val;
  __cil_tmp15 = *__cil_tmp14;
  if (__cil_tmp15 > 100UL) {
    return ((ssize_t )-22);
  } else {
  }
  }
  __cil_tmp16 = & param;
  __cil_tmp17 = & val;
  __cil_tmp18 = *__cil_tmp17;
  *((u32 *)__cil_tmp16) = (u32 )__cil_tmp18;
  __cil_tmp19 = (unsigned long )(& param) + 4;
  *((u32 *)__cil_tmp19) = (u32 )0;
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp20 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp21 = (spinlock_t *)__cil_tmp20;
      tmp___7 = spinlock_check(__cil_tmp21);
      flags = _raw_spin_lock_irqsave(tmp___7);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  {
  __cil_tmp22 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp23 = *((struct gsmi_buf **)__cil_tmp22);
  __cil_tmp24 = *((u8 **)__cil_tmp23);
  __cil_tmp25 = (void *)__cil_tmp24;
  __cil_tmp26 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp27 = *((struct gsmi_buf **)__cil_tmp26);
  __cil_tmp28 = (unsigned long )__cil_tmp27;
  __cil_tmp29 = __cil_tmp28 + 8;
  __cil_tmp30 = *((size_t *)__cil_tmp29);
  memset(__cil_tmp25, 0, __cil_tmp30);
  __len = 8UL;
  }
  if (__len >= 64UL) {
    {
    __cil_tmp31 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp32 = *((struct gsmi_buf **)__cil_tmp31);
    __cil_tmp33 = *((u8 **)__cil_tmp32);
    __cil_tmp34 = (void *)__cil_tmp33;
    __cil_tmp35 = (void const *)(& param);
    __ret = memmove(__cil_tmp34, __cil_tmp35, __len);
    }
  } else {
    {
    __cil_tmp36 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp37 = *((struct gsmi_buf **)__cil_tmp36);
    __cil_tmp38 = *((u8 **)__cil_tmp37);
    __cil_tmp39 = (void *)__cil_tmp38;
    __cil_tmp40 = (void const *)(& param);
    __ret = memmove(__cil_tmp39, __cil_tmp40, __len);
    }
  }
  {
  __cil_tmp41 = (u8 )239;
  __cil_tmp42 = (u8 )9;
  rc = gsmi_exec(__cil_tmp41, __cil_tmp42);
  __cil_tmp43 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp44 = (spinlock_t *)__cil_tmp43;
  spin_unlock_irqrestore(__cil_tmp44, flags);
  }
  if (rc) {
    return ((ssize_t )rc);
  } else {
  }
  return ((ssize_t )count);
}
}
static struct kobj_attribute gsmi_clear_eventlog_attr = {{"clear_eventlog", (umode_t )128}, (ssize_t (*)(struct kobject *kobj , struct kobj_attribute *attr ,
                                                    char *buf ))0, & gsmi_clear_eventlog_store};
static ssize_t gsmi_clear_config_store(struct kobject *kobj , struct kobj_attribute *attr ,
                                       char const *buf , size_t count )
{ int rc ;
  unsigned long flags ;
  raw_spinlock_t *tmp___7 ;
  unsigned long __cil_tmp10 ;
  spinlock_t *__cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  struct gsmi_buf *__cil_tmp13 ;
  u8 *__cil_tmp14 ;
  void *__cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  struct gsmi_buf *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  size_t __cil_tmp20 ;
  u8 __cil_tmp21 ;
  u8 __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  spinlock_t *__cil_tmp24 ;
  {
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp10 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp11 = (spinlock_t *)__cil_tmp10;
      tmp___7 = spinlock_check(__cil_tmp11);
      flags = _raw_spin_lock_irqsave(tmp___7);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  {
  __cil_tmp12 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp13 = *((struct gsmi_buf **)__cil_tmp12);
  __cil_tmp14 = *((u8 **)__cil_tmp13);
  __cil_tmp15 = (void *)__cil_tmp14;
  __cil_tmp16 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp17 = *((struct gsmi_buf **)__cil_tmp16);
  __cil_tmp18 = (unsigned long )__cil_tmp17;
  __cil_tmp19 = __cil_tmp18 + 8;
  __cil_tmp20 = *((size_t *)__cil_tmp19);
  memset(__cil_tmp15, 0, __cil_tmp20);
  __cil_tmp21 = (u8 )239;
  __cil_tmp22 = (u8 )32;
  rc = gsmi_exec(__cil_tmp21, __cil_tmp22);
  __cil_tmp23 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp24 = (spinlock_t *)__cil_tmp23;
  spin_unlock_irqrestore(__cil_tmp24, flags);
  }
  if (rc) {
    return ((ssize_t )rc);
  } else {
  }
  return ((ssize_t )count);
}
}
static struct kobj_attribute gsmi_clear_config_attr = {{"clear_config", (umode_t )128}, (ssize_t (*)(struct kobject *kobj , struct kobj_attribute *attr ,
                                                  char *buf ))0, & gsmi_clear_config_store};
static struct attribute const *gsmi_attrs[3] = { (struct attribute const *)(& gsmi_clear_config_attr.attr), (struct attribute const *)(& gsmi_clear_eventlog_attr.attr), (struct attribute const *)((void *)0)};
static int saved_reason ;
static int gsmi_shutdown_reason(int reason )
{ struct gsmi_log_entry_type_1 entry ;
  struct gsmi_set_eventlog_param param ;
  int rc ;
  unsigned long flags ;
  raw_spinlock_t *tmp___7 ;
  size_t __len ;
  void *__ret ;
  size_t __len___0 ;
  void *__ret___0 ;
  struct gsmi_log_entry_type_1 *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  struct gsmi_set_eventlog_param *__cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  int __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  spinlock_t *__cil_tmp20 ;
  int __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  struct gsmi_buf *__cil_tmp23 ;
  u8 *__cil_tmp24 ;
  void *__cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct gsmi_buf *__cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  size_t __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  struct gsmi_buf *__cil_tmp32 ;
  u8 *__cil_tmp33 ;
  void *__cil_tmp34 ;
  void const *__cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  struct gsmi_buf *__cil_tmp37 ;
  u8 *__cil_tmp38 ;
  void *__cil_tmp39 ;
  void const *__cil_tmp40 ;
  struct gsmi_set_eventlog_param *__cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  struct gsmi_buf *__cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  struct gsmi_buf *__cil_tmp47 ;
  u8 *__cil_tmp48 ;
  void *__cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  struct gsmi_buf *__cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  size_t __cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  struct gsmi_buf *__cil_tmp56 ;
  u8 *__cil_tmp57 ;
  void *__cil_tmp58 ;
  void const *__cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  struct gsmi_buf *__cil_tmp61 ;
  u8 *__cil_tmp62 ;
  void *__cil_tmp63 ;
  void const *__cil_tmp64 ;
  u8 __cil_tmp65 ;
  u8 __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  spinlock_t *__cil_tmp68 ;
  {
  __cil_tmp13 = & entry;
  *((u16 *)__cil_tmp13) = (u16 )57005;
  __cil_tmp14 = (unsigned long )(& entry) + 2;
  *((u32 *)__cil_tmp14) = (u32 )reason;
  __cil_tmp15 = & param;
  *((u32 *)__cil_tmp15) = 0U;
  __cil_tmp16 = (unsigned long )(& param) + 4;
  *((u32 *)__cil_tmp16) = (u32 )6UL;
  __cil_tmp17 = (unsigned long )(& param) + 8;
  *((u32 *)__cil_tmp17) = (u32 )1;
  rc = 0;
  {
  __cil_tmp18 = 1 << reason;
  if (saved_reason & __cil_tmp18) {
    return (0);
  } else {
  }
  }
  {
  while (1) {
    while_continue: ;
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp19 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp20 = (spinlock_t *)__cil_tmp19;
      tmp___7 = spinlock_check(__cil_tmp20);
      flags = _raw_spin_lock_irqsave(tmp___7);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  {
  __cil_tmp21 = 1 << reason;
  saved_reason = saved_reason | __cil_tmp21;
  __cil_tmp22 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp23 = *((struct gsmi_buf **)__cil_tmp22);
  __cil_tmp24 = *((u8 **)__cil_tmp23);
  __cil_tmp25 = (void *)__cil_tmp24;
  __cil_tmp26 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp27 = *((struct gsmi_buf **)__cil_tmp26);
  __cil_tmp28 = (unsigned long )__cil_tmp27;
  __cil_tmp29 = __cil_tmp28 + 8;
  __cil_tmp30 = *((size_t *)__cil_tmp29);
  memset(__cil_tmp25, 0, __cil_tmp30);
  __len = 6UL;
  }
  if (__len >= 64UL) {
    {
    __cil_tmp31 = (unsigned long )(& gsmi_dev) + 16;
    __cil_tmp32 = *((struct gsmi_buf **)__cil_tmp31);
    __cil_tmp33 = *((u8 **)__cil_tmp32);
    __cil_tmp34 = (void *)__cil_tmp33;
    __cil_tmp35 = (void const *)(& entry);
    __ret = memmove(__cil_tmp34, __cil_tmp35, __len);
    }
  } else {
    {
    __cil_tmp36 = (unsigned long )(& gsmi_dev) + 16;
    __cil_tmp37 = *((struct gsmi_buf **)__cil_tmp36);
    __cil_tmp38 = *((u8 **)__cil_tmp37);
    __cil_tmp39 = (void *)__cil_tmp38;
    __cil_tmp40 = (void const *)(& entry);
    __ret = memmove(__cil_tmp39, __cil_tmp40, __len);
    }
  }
  {
  __cil_tmp41 = & param;
  __cil_tmp42 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp43 = *((struct gsmi_buf **)__cil_tmp42);
  __cil_tmp44 = (unsigned long )__cil_tmp43;
  __cil_tmp45 = __cil_tmp44 + 24;
  *((u32 *)__cil_tmp41) = *((u32 *)__cil_tmp45);
  __cil_tmp46 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp47 = *((struct gsmi_buf **)__cil_tmp46);
  __cil_tmp48 = *((u8 **)__cil_tmp47);
  __cil_tmp49 = (void *)__cil_tmp48;
  __cil_tmp50 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp51 = *((struct gsmi_buf **)__cil_tmp50);
  __cil_tmp52 = (unsigned long )__cil_tmp51;
  __cil_tmp53 = __cil_tmp52 + 8;
  __cil_tmp54 = *((size_t *)__cil_tmp53);
  memset(__cil_tmp49, 0, __cil_tmp54);
  __len___0 = 12UL;
  }
  if (__len___0 >= 64UL) {
    {
    __cil_tmp55 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp56 = *((struct gsmi_buf **)__cil_tmp55);
    __cil_tmp57 = *((u8 **)__cil_tmp56);
    __cil_tmp58 = (void *)__cil_tmp57;
    __cil_tmp59 = (void const *)(& param);
    __ret___0 = memmove(__cil_tmp58, __cil_tmp59, __len___0);
    }
  } else {
    {
    __cil_tmp60 = (unsigned long )(& gsmi_dev) + 24;
    __cil_tmp61 = *((struct gsmi_buf **)__cil_tmp60);
    __cil_tmp62 = *((u8 **)__cil_tmp61);
    __cil_tmp63 = (void *)__cil_tmp62;
    __cil_tmp64 = (void const *)(& param);
    __ret___0 = memmove(__cil_tmp63, __cil_tmp64, __len___0);
    }
  }
  {
  __cil_tmp65 = (u8 )239;
  __cil_tmp66 = (u8 )8;
  rc = gsmi_exec(__cil_tmp65, __cil_tmp66);
  __cil_tmp67 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp68 = (spinlock_t *)__cil_tmp67;
  spin_unlock_irqrestore(__cil_tmp68, flags);
  }
  if (rc < 0) {
    {
    printk("<3>gsmi: Log Shutdown Reason failed\n");
    }
  } else {
    {
    printk("<0>gsmi: Log Shutdown Reason 0x%02x\n", reason);
    }
  }
  return (rc);
}
}
static int gsmi_reboot_callback(struct notifier_block *nb , unsigned long reason ,
                                void *arg )
{
  {
  {
  gsmi_shutdown_reason(0);
  }
  return (0);
}
}
static struct notifier_block gsmi_reboot_notifier = {& gsmi_reboot_callback, (struct notifier_block *)0, 0};
static int gsmi_die_callback(struct notifier_block *nb , unsigned long reason , void *arg )
{
  {
  if (reason == 1UL) {
    {
    gsmi_shutdown_reason(3);
    }
  } else {
  }
  return (0);
}
}
static struct notifier_block gsmi_die_notifier = {& gsmi_die_callback, (struct notifier_block *)0, 0};
static int gsmi_panic_callback(struct notifier_block *nb , unsigned long reason ,
                               void *arg )
{
  {
  {
  gsmi_shutdown_reason(2);
  }
  return (0);
}
}
static struct notifier_block gsmi_panic_notifier = {& gsmi_panic_callback, (struct notifier_block *)0, 0};
static u64 local_hash_64(u64 val , unsigned int bits ) __attribute__((__section__(".init.text"),
__no_instrument_function__)) ;
static u64 local_hash_64(u64 val , unsigned int bits )
{ u64 hash ;
  u64 n ;
  unsigned int __cil_tmp5 ;
  {
  hash = val;
  n = hash;
  n = n << 18;
  hash = hash - n;
  n = n << 33;
  hash = hash - n;
  n = n << 3;
  hash = hash + n;
  n = n << 3;
  hash = hash - n;
  n = n << 4;
  hash = hash + n;
  n = n << 2;
  hash = hash + n;
  {
  __cil_tmp5 = 64U - bits;
  return (hash >> __cil_tmp5);
  }
}
}
static u32 hash_oem_table_id(char *s ) __attribute__((__section__(".init.text"),
__no_instrument_function__)) ;
static u32 hash_oem_table_id(char *s )
{ u64 input ;
  size_t __len ;
  void *__ret ;
  u64 tmp___7 ;
  void *__cil_tmp6 ;
  void const *__cil_tmp7 ;
  void *__cil_tmp8 ;
  void const *__cil_tmp9 ;
  u64 *__cil_tmp10 ;
  u64 __cil_tmp11 ;
  {
  __len = (size_t )8;
  if (__len >= 64UL) {
    {
    __cil_tmp6 = (void *)(& input);
    __cil_tmp7 = (void const *)s;
    __ret = memmove(__cil_tmp6, __cil_tmp7, __len);
    }
  } else {
    {
    __cil_tmp8 = (void *)(& input);
    __cil_tmp9 = (void const *)s;
    __ret = memmove(__cil_tmp8, __cil_tmp9, __len);
    }
  }
  {
  __cil_tmp10 = & input;
  __cil_tmp11 = *__cil_tmp10;
  tmp___7 = local_hash_64(__cil_tmp11, 32U);
  }
  return ((u32 )tmp___7);
}
}
static struct dmi_system_id gsmi_dmi_table[1] __attribute__((__section__(".init.data"))) = { {(int (*)(struct dmi_system_id const * ))0,
      "Google Board", {{(unsigned char)9, {(char )'G', (char )'o', (char )'o', (char )'g',
                                           (char )'l', (char )'e', (char )',', (char )' ',
                                           (char )'I', (char )'n', (char )'c', (char )'.',
                                           (char )'\000'}}, {(unsigned char)0, {(char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0,
                                                                                (char)0}},
                       {(unsigned char)0, {(char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0, (char)0,
                                           (char)0, (char)0, (char)0, (char)0}}, {(unsigned char)0,
                                                                                  {(char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0,
                                                                                   (char)0}}},
      (void *)0}};
extern struct dmi_system_id const __mod_dmi_device_table __attribute__((__unused__,
__alias__("gsmi_dmi_table"))) ;
static int gsmi_system_valid(void) __attribute__((__section__(".init.text"), __no_instrument_function__)) ;
static int gsmi_system_valid(void)
{ u32 hash ;
  int tmp___7 ;
  int tmp___8 ;
  char const *bios_ver ;
  char const *tmp___9 ;
  int tmp___10 ;
  unsigned long __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  struct dmi_system_id *__cil_tmp9 ;
  struct dmi_system_id const *__cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  char *__cil_tmp15 ;
  char const *__cil_tmp16 ;
  __kernel_size_t __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  char *__cil_tmp22 ;
  char *__cil_tmp23 ;
  __kernel_size_t __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  u32 __cil_tmp26 ;
  {
  {
  __cil_tmp7 = 0 * 344UL;
  __cil_tmp8 = (unsigned long )(gsmi_dmi_table) + __cil_tmp7;
  __cil_tmp9 = (struct dmi_system_id *)__cil_tmp8;
  __cil_tmp10 = (struct dmi_system_id const *)__cil_tmp9;
  tmp___7 = dmi_check_system(__cil_tmp10);
  }
  if (tmp___7) {
  } else {
    return (-19);
  }
  {
  __cil_tmp11 = 0 * 1UL;
  __cil_tmp12 = 16 + __cil_tmp11;
  __cil_tmp13 = 0 + __cil_tmp12;
  __cil_tmp14 = (unsigned long )(& acpi_gbl_FADT) + __cil_tmp13;
  __cil_tmp15 = (char *)__cil_tmp14;
  __cil_tmp16 = (char const *)__cil_tmp15;
  __cil_tmp17 = (__kernel_size_t )4;
  tmp___8 = strncmp(__cil_tmp16, "FACP", __cil_tmp17);
  }
  if (tmp___8) {
  } else {
    {
    printk("<6>gsmi: Board is too old\n");
    }
    return (-19);
  }
  {
  __cil_tmp18 = 0 * 1UL;
  __cil_tmp19 = 16 + __cil_tmp18;
  __cil_tmp20 = 0 + __cil_tmp19;
  __cil_tmp21 = (unsigned long )(& acpi_gbl_FADT) + __cil_tmp20;
  __cil_tmp22 = (char *)__cil_tmp21;
  __cil_tmp23 = (char *)__cil_tmp22;
  hash = hash_oem_table_id(__cil_tmp23);
  }
  if (hash == 2023950928U) {
    {
    tmp___9 = dmi_get_system_info(2);
    bios_ver = tmp___9;
    __cil_tmp24 = (__kernel_size_t )3;
    tmp___10 = strncmp(bios_ver, "1.0", __cil_tmp24);
    }
    if (tmp___10 == 0) {
      {
      printk("<6>gsmi: disabled on this board\'s BIOS %s\n", bios_ver);
      }
      return (-19);
    } else {
    }
  } else {
  }
  {
  __cil_tmp25 = (unsigned long )(& acpi_gbl_FADT) + 48;
  __cil_tmp26 = *((u32 *)__cil_tmp25);
  if (__cil_tmp26 == 0U) {
    {
    printk("<6>gsmi: missing smi_command\n");
    }
    return (-19);
  } else {
  }
  }
  return (0);
}
}
static struct kobject *gsmi_kobj ;
static struct efivars efivars ;
static struct lock_class_key __key___4 ;
static int gsmi_init(void) __attribute__((__section__(".init.text"), __no_instrument_function__)) ;
static int gsmi_init(void)
{ unsigned long flags ;
  int ret ;
  long tmp___7 ;
  long tmp___8 ;
  raw_spinlock_t *tmp___9 ;
  unsigned long __cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  u32 __cil_tmp10 ;
  struct gsmi_device *__cil_tmp11 ;
  void *__cil_tmp12 ;
  struct resource const *__cil_tmp13 ;
  struct gsmi_device *__cil_tmp14 ;
  struct platform_device *__cil_tmp15 ;
  void const *__cil_tmp16 ;
  struct gsmi_device *__cil_tmp17 ;
  struct platform_device *__cil_tmp18 ;
  void const *__cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  spinlock_t *__cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  struct raw_spinlock *__cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  struct gsmi_device *__cil_tmp25 ;
  struct platform_device *__cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  struct gsmi_device *__cil_tmp31 ;
  struct platform_device *__cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  struct gsmi_device *__cil_tmp36 ;
  struct platform_device *__cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  struct gsmi_device *__cil_tmp41 ;
  struct platform_device *__cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  struct device *__cil_tmp45 ;
  size_t __cil_tmp46 ;
  size_t __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  struct dma_pool *__cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  struct gsmi_buf *__cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  unsigned long __cil_tmp54 ;
  struct gsmi_buf *__cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  struct gsmi_buf *__cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  spinlock_t *__cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  u8 __cil_tmp63 ;
  u8 __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  int __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  spinlock_t *__cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  int __cil_tmp71 ;
  struct bin_attribute const *__cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  struct attribute const **__cil_tmp75 ;
  unsigned long __cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  struct attribute const **__cil_tmp78 ;
  struct bin_attribute const *__cil_tmp79 ;
  unsigned long __cil_tmp80 ;
  struct gsmi_buf *__cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  struct gsmi_buf *__cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  struct gsmi_buf *__cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  struct dma_pool *__cil_tmp88 ;
  struct gsmi_device *__cil_tmp89 ;
  struct platform_device *__cil_tmp90 ;
  {
  {
  ret = gsmi_system_valid();
  }
  if (ret) {
    return (ret);
  } else {
  }
  {
  __cil_tmp8 = (unsigned long )(& gsmi_dev) + 56;
  __cil_tmp9 = (unsigned long )(& acpi_gbl_FADT) + 48;
  __cil_tmp10 = *((u32 *)__cil_tmp9);
  *((u16 *)__cil_tmp8) = (u16 )__cil_tmp10;
  __cil_tmp11 = & gsmi_dev;
  __cil_tmp12 = (void *)0;
  __cil_tmp13 = (struct resource const *)__cil_tmp12;
  *((struct platform_device **)__cil_tmp11) = platform_device_register_simple("gsmi",
                                                                              -1,
                                                                              __cil_tmp13,
                                                                              0U);
  __cil_tmp14 = & gsmi_dev;
  __cil_tmp15 = *((struct platform_device **)__cil_tmp14);
  __cil_tmp16 = (void const *)__cil_tmp15;
  tmp___8 = (long )IS_ERR(__cil_tmp16);
  }
  if (tmp___8) {
    {
    printk("<3>gsmi: unable to register platform device\n");
    __cil_tmp17 = & gsmi_dev;
    __cil_tmp18 = *((struct platform_device **)__cil_tmp17);
    __cil_tmp19 = (void const *)__cil_tmp18;
    tmp___7 = (long )PTR_ERR(__cil_tmp19);
    }
    return ((int )tmp___7);
  } else {
  }
  {
  while (1) {
    while_continue: ;
    {
    __cil_tmp20 = (unsigned long )(& gsmi_dev) + 32;
    __cil_tmp21 = (spinlock_t *)__cil_tmp20;
    spinlock_check(__cil_tmp21);
    }
    {
    while (1) {
      while_continue___0: ;
      {
      __cil_tmp22 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp23 = (struct raw_spinlock *)__cil_tmp22;
      __raw_spin_lock_init(__cil_tmp23, "&(&gsmi_dev.lock)->rlock", & __key___4);
      }
      goto while_break___0;
    }
    while_break___0: ;
    }
    goto while_break;
  }
  while_break: ;
  }
  {
  __cil_tmp24 = 16 + 592;
  __cil_tmp25 = & gsmi_dev;
  __cil_tmp26 = *((struct platform_device **)__cil_tmp25);
  __cil_tmp27 = (unsigned long )__cil_tmp26;
  __cil_tmp28 = __cil_tmp27 + __cil_tmp24;
  __cil_tmp29 = 1ULL << 32;
  *((u64 *)__cil_tmp28) = __cil_tmp29 - 1ULL;
  __cil_tmp30 = 16 + 584;
  __cil_tmp31 = & gsmi_dev;
  __cil_tmp32 = *((struct platform_device **)__cil_tmp31);
  __cil_tmp33 = (unsigned long )__cil_tmp32;
  __cil_tmp34 = __cil_tmp33 + __cil_tmp30;
  __cil_tmp35 = 16 + 592;
  __cil_tmp36 = & gsmi_dev;
  __cil_tmp37 = *((struct platform_device **)__cil_tmp36);
  __cil_tmp38 = (unsigned long )__cil_tmp37;
  __cil_tmp39 = __cil_tmp38 + __cil_tmp35;
  *((u64 **)__cil_tmp34) = (u64 *)__cil_tmp39;
  ret = -12;
  __cil_tmp40 = (unsigned long )(& gsmi_dev) + 64;
  __cil_tmp41 = & gsmi_dev;
  __cil_tmp42 = *((struct platform_device **)__cil_tmp41);
  __cil_tmp43 = (unsigned long )__cil_tmp42;
  __cil_tmp44 = __cil_tmp43 + 16;
  __cil_tmp45 = (struct device *)__cil_tmp44;
  __cil_tmp46 = (size_t )1024;
  __cil_tmp47 = (size_t )0;
  *((struct dma_pool **)__cil_tmp40) = dma_pool_create("gsmi", __cil_tmp45, __cil_tmp46,
                                                       8UL, __cil_tmp47);
  }
  {
  __cil_tmp48 = (unsigned long )(& gsmi_dev) + 64;
  __cil_tmp49 = *((struct dma_pool **)__cil_tmp48);
  if (! __cil_tmp49) {
    goto out_err;
  } else {
  }
  }
  {
  __cil_tmp50 = (unsigned long )(& gsmi_dev) + 8;
  *((struct gsmi_buf **)__cil_tmp50) = gsmi_buf_alloc();
  }
  {
  __cil_tmp51 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp52 = *((struct gsmi_buf **)__cil_tmp51);
  if (! __cil_tmp52) {
    {
    printk("<3>gsmi: failed to allocate name buffer\n");
    }
    goto out_err;
  } else {
  }
  }
  {
  __cil_tmp53 = (unsigned long )(& gsmi_dev) + 16;
  *((struct gsmi_buf **)__cil_tmp53) = gsmi_buf_alloc();
  }
  {
  __cil_tmp54 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp55 = *((struct gsmi_buf **)__cil_tmp54);
  if (! __cil_tmp55) {
    {
    printk("<3>gsmi: failed to allocate data buffer\n");
    }
    goto out_err;
  } else {
  }
  }
  {
  __cil_tmp56 = (unsigned long )(& gsmi_dev) + 24;
  *((struct gsmi_buf **)__cil_tmp56) = gsmi_buf_alloc();
  }
  {
  __cil_tmp57 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp58 = *((struct gsmi_buf **)__cil_tmp57);
  if (! __cil_tmp58) {
    {
    printk("<3>gsmi: failed to allocate param buffer\n");
    }
    goto out_err;
  } else {
  }
  }
  {
  while (1) {
    while_continue___1: ;
    {
    while (1) {
      while_continue___2: ;
      {
      __cil_tmp59 = (unsigned long )(& gsmi_dev) + 32;
      __cil_tmp60 = (spinlock_t *)__cil_tmp59;
      tmp___9 = spinlock_check(__cil_tmp60);
      flags = _raw_spin_lock_irqsave(tmp___9);
      }
      goto while_break___2;
    }
    while_break___2: ;
    }
    goto while_break___1;
  }
  while_break___1: ;
  }
  {
  __cil_tmp61 = (unsigned long )(& gsmi_dev) + 60;
  *((int *)__cil_tmp61) = 125;
  __cil_tmp62 = (unsigned long )(& gsmi_dev) + 60;
  __cil_tmp63 = (u8 )239;
  __cil_tmp64 = (u8 )193;
  *((int *)__cil_tmp62) = gsmi_exec(__cil_tmp63, __cil_tmp64);
  }
  {
  __cil_tmp65 = (unsigned long )(& gsmi_dev) + 60;
  __cil_tmp66 = *((int *)__cil_tmp65);
  if (__cil_tmp66 == -38) {
    __cil_tmp67 = (unsigned long )(& gsmi_dev) + 60;
    *((int *)__cil_tmp67) = 127;
  } else {
  }
  }
  {
  __cil_tmp68 = (unsigned long )(& gsmi_dev) + 32;
  __cil_tmp69 = (spinlock_t *)__cil_tmp68;
  spin_unlock_irqrestore(__cil_tmp69, flags);
  }
  {
  __cil_tmp70 = (unsigned long )(& gsmi_dev) + 60;
  __cil_tmp71 = *((int *)__cil_tmp70);
  if (__cil_tmp71 == -6) {
    {
    printk("<6>gsmi version 1.0 failed to load\n");
    ret = -19;
    }
    goto out_err;
  } else {
  }
  }
  {
  ret = -12;
  gsmi_kobj = (struct kobject *)kobject_create_and_add("gsmi", firmware_kobj);
  }
  if (! gsmi_kobj) {
    {
    printk("<6>gsmi: Failed to create firmware kobj\n");
    }
    goto out_err;
  } else {
  }
  {
  __cil_tmp72 = (struct bin_attribute const *)(& eventlog_bin_attr);
  ret = (int )sysfs_create_bin_file(gsmi_kobj, __cil_tmp72);
  }
  if (ret) {
    {
    printk("<6>gsmi: Failed to setup eventlog");
    }
    goto out_err;
  } else {
  }
  {
  __cil_tmp73 = 0 * 8UL;
  __cil_tmp74 = (unsigned long )(gsmi_attrs) + __cil_tmp73;
  __cil_tmp75 = (struct attribute const **)__cil_tmp74;
  ret = (int )sysfs_create_files(gsmi_kobj, __cil_tmp75);
  }
  if (ret) {
    {
    printk("<6>gsmi: Failed to add attrs");
    }
    goto out_remove_bin_file;
  } else {
  }
  {
  ret = register_efivars(& efivars, & efivar_ops, gsmi_kobj);
  }
  if (ret) {
    {
    printk("<6>gsmi: Failed to register efivars\n");
    }
    goto out_remove_sysfs_files;
  } else {
  }
  {
  register_reboot_notifier(& gsmi_reboot_notifier);
  register_die_notifier(& gsmi_die_notifier);
  atomic_notifier_chain_register(& panic_notifier_list, & gsmi_panic_notifier);
  printk("<6>gsmi version 1.0 loaded\n");
  }
  return (0);
  out_remove_sysfs_files:
  {
  __cil_tmp76 = 0 * 8UL;
  __cil_tmp77 = (unsigned long )(gsmi_attrs) + __cil_tmp76;
  __cil_tmp78 = (struct attribute const **)__cil_tmp77;
  sysfs_remove_files(gsmi_kobj, __cil_tmp78);
  }
  out_remove_bin_file:
  {
  __cil_tmp79 = (struct bin_attribute const *)(& eventlog_bin_attr);
  sysfs_remove_bin_file(gsmi_kobj, __cil_tmp79);
  }
  out_err:
  {
  kobject_put(gsmi_kobj);
  __cil_tmp80 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp81 = *((struct gsmi_buf **)__cil_tmp80);
  gsmi_buf_free(__cil_tmp81);
  __cil_tmp82 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp83 = *((struct gsmi_buf **)__cil_tmp82);
  gsmi_buf_free(__cil_tmp83);
  __cil_tmp84 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp85 = *((struct gsmi_buf **)__cil_tmp84);
  gsmi_buf_free(__cil_tmp85);
  }
  {
  __cil_tmp86 = (unsigned long )(& gsmi_dev) + 64;
  if (*((struct dma_pool **)__cil_tmp86)) {
    {
    __cil_tmp87 = (unsigned long )(& gsmi_dev) + 64;
    __cil_tmp88 = *((struct dma_pool **)__cil_tmp87);
    dma_pool_destroy(__cil_tmp88);
    }
  } else {
  }
  }
  {
  __cil_tmp89 = & gsmi_dev;
  __cil_tmp90 = *((struct platform_device **)__cil_tmp89);
  platform_device_unregister(__cil_tmp90);
  printk("<6>gsmi: failed to load: %d\n", ret);
  }
  return (ret);
}
}
static void gsmi_exit(void) __attribute__((__section__(".exit.text"), __no_instrument_function__)) ;
static void gsmi_exit(void)
{ unsigned long __cil_tmp1 ;
  unsigned long __cil_tmp2 ;
  struct attribute const **__cil_tmp3 ;
  struct bin_attribute const *__cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  struct gsmi_buf *__cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  struct gsmi_buf *__cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  struct gsmi_buf *__cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  struct dma_pool *__cil_tmp12 ;
  struct gsmi_device *__cil_tmp13 ;
  struct platform_device *__cil_tmp14 ;
  {
  {
  unregister_reboot_notifier(& gsmi_reboot_notifier);
  unregister_die_notifier(& gsmi_die_notifier);
  atomic_notifier_chain_unregister(& panic_notifier_list, & gsmi_panic_notifier);
  unregister_efivars(& efivars);
  __cil_tmp1 = 0 * 8UL;
  __cil_tmp2 = (unsigned long )(gsmi_attrs) + __cil_tmp1;
  __cil_tmp3 = (struct attribute const **)__cil_tmp2;
  sysfs_remove_files(gsmi_kobj, __cil_tmp3);
  __cil_tmp4 = (struct bin_attribute const *)(& eventlog_bin_attr);
  sysfs_remove_bin_file(gsmi_kobj, __cil_tmp4);
  kobject_put(gsmi_kobj);
  __cil_tmp5 = (unsigned long )(& gsmi_dev) + 24;
  __cil_tmp6 = *((struct gsmi_buf **)__cil_tmp5);
  gsmi_buf_free(__cil_tmp6);
  __cil_tmp7 = (unsigned long )(& gsmi_dev) + 16;
  __cil_tmp8 = *((struct gsmi_buf **)__cil_tmp7);
  gsmi_buf_free(__cil_tmp8);
  __cil_tmp9 = (unsigned long )(& gsmi_dev) + 8;
  __cil_tmp10 = *((struct gsmi_buf **)__cil_tmp9);
  gsmi_buf_free(__cil_tmp10);
  __cil_tmp11 = (unsigned long )(& gsmi_dev) + 64;
  __cil_tmp12 = *((struct dma_pool **)__cil_tmp11);
  dma_pool_destroy(__cil_tmp12);
  __cil_tmp13 = & gsmi_dev;
  __cil_tmp14 = *((struct platform_device **)__cil_tmp13);
  platform_device_unregister(__cil_tmp14);
  }
  return;
}
}
int init_module(void)
{ int tmp___7 ;
  {
  {
  tmp___7 = gsmi_init();
  }
  return (tmp___7);
}
}
void cleanup_module(void)
{
  {
  {
  gsmi_exit();
  }
  return;
}
}
static char const __mod_author949[20] __attribute__((__used__, __unused__, __section__(".modinfo"),
__aligned__(1))) =
  { (char const )'a', (char const )'u', (char const )'t', (char const )'h',
        (char const )'o', (char const )'r', (char const )'=', (char const )'G',
        (char const )'o', (char const )'o', (char const )'g', (char const )'l',
        (char const )'e', (char const )',', (char const )' ', (char const )'I',
        (char const )'n', (char const )'c', (char const )'.', (char const )'\000'};
static char const __mod_license950[12] __attribute__((__used__, __unused__, __section__(".modinfo"),
__aligned__(1))) =
  { (char const )'l', (char const )'i', (char const )'c', (char const )'e',
        (char const )'n', (char const )'s', (char const )'e', (char const )'=',
        (char const )'G', (char const )'P', (char const )'L', (char const )'\000'};
void ldv_check_final_state(void) ;
extern void ldv_initialize(void) ;
extern int __VERIFIER_nondet_int(void) ;
int LDV_IN_INTERRUPT ;
void main(void)
{ efi_char16_t *var_gsmi_get_variable_4_p0 ;
  efi_guid_t *var_gsmi_get_variable_4_p1 ;
  u32 *var_gsmi_get_variable_4_p2 ;
  unsigned long *var_gsmi_get_variable_4_p3 ;
  void *var_gsmi_get_variable_4_p4 ;
  efi_char16_t *var_gsmi_set_variable_6_p0 ;
  efi_guid_t *var_gsmi_set_variable_6_p1 ;
  u32 var_gsmi_set_variable_6_p2 ;
  unsigned long var_gsmi_set_variable_6_p3 ;
  void *var_gsmi_set_variable_6_p4 ;
  unsigned long *var_gsmi_get_next_variable_5_p0 ;
  efi_char16_t *var_gsmi_get_next_variable_5_p1 ;
  efi_guid_t *var_gsmi_get_next_variable_5_p2 ;
  struct file *var_group1 ;
  struct kobject *var_group2 ;
  struct bin_attribute *var_eventlog_write_7_p2 ;
  char *var_eventlog_write_7_p3 ;
  loff_t var_eventlog_write_7_p4 ;
  size_t var_eventlog_write_7_p5 ;
  struct kobj_attribute *var_group3 ;
  char const *var_gsmi_clear_eventlog_store_8_p2 ;
  size_t var_gsmi_clear_eventlog_store_8_p3 ;
  char const *var_gsmi_clear_config_store_9_p2 ;
  size_t var_gsmi_clear_config_store_9_p3 ;
  struct notifier_block *var_group4 ;
  unsigned long var_gsmi_reboot_callback_11_p1 ;
  void *var_gsmi_reboot_callback_11_p2 ;
  unsigned long var_gsmi_die_callback_12_p1 ;
  void *var_gsmi_die_callback_12_p2 ;
  unsigned long var_gsmi_panic_callback_13_p1 ;
  void *var_gsmi_panic_callback_13_p2 ;
  int tmp___7 ;
  int tmp___8 ;
  int tmp___9 ;
  {
  {
  LDV_IN_INTERRUPT = 1;
  ldv_initialize();
  tmp___7 = gsmi_init();
  }
  if (tmp___7) {
    goto ldv_final;
  } else {
  }
  {
  while (1) {
    while_continue: ;
    {
    tmp___9 = __VERIFIER_nondet_int();
    }
    if (tmp___9) {
    } else {
      goto while_break;
    }
    {
    tmp___8 = __VERIFIER_nondet_int();
    }
    if (tmp___8 == 0) {
      goto case_0;
    } else
    if (tmp___8 == 1) {
      goto case_1;
    } else
    if (tmp___8 == 2) {
      goto case_2;
    } else
    if (tmp___8 == 3) {
      goto case_3;
    } else
    if (tmp___8 == 4) {
      goto case_4;
    } else
    if (tmp___8 == 5) {
      goto case_5;
    } else
    if (tmp___8 == 6) {
      goto case_6;
    } else
    if (tmp___8 == 7) {
      goto case_7;
    } else
    if (tmp___8 == 8) {
      goto case_8;
    } else {
      {
      goto switch_default;
      if (0) {
        case_0:
        {
        gsmi_get_variable(var_gsmi_get_variable_4_p0, var_gsmi_get_variable_4_p1,
                          var_gsmi_get_variable_4_p2, var_gsmi_get_variable_4_p3,
                          var_gsmi_get_variable_4_p4);
        }
        goto switch_break;
        case_1:
        {
        gsmi_set_variable(var_gsmi_set_variable_6_p0, var_gsmi_set_variable_6_p1,
                          var_gsmi_set_variable_6_p2, var_gsmi_set_variable_6_p3,
                          var_gsmi_set_variable_6_p4);
        }
        goto switch_break;
        case_2:
        {
        gsmi_get_next_variable(var_gsmi_get_next_variable_5_p0, var_gsmi_get_next_variable_5_p1,
                               var_gsmi_get_next_variable_5_p2);
        }
        goto switch_break;
        case_3:
        {
        eventlog_write(var_group1, var_group2, var_eventlog_write_7_p2, var_eventlog_write_7_p3,
                       var_eventlog_write_7_p4, var_eventlog_write_7_p5);
        }
        goto switch_break;
        case_4:
        {
        gsmi_clear_eventlog_store(var_group2, var_group3, var_gsmi_clear_eventlog_store_8_p2,
                                  var_gsmi_clear_eventlog_store_8_p3);
        }
        goto switch_break;
        case_5:
        {
        gsmi_clear_config_store(var_group2, var_group3, var_gsmi_clear_config_store_9_p2,
                                var_gsmi_clear_config_store_9_p3);
        }
        goto switch_break;
        case_6:
        {
        gsmi_reboot_callback(var_group4, var_gsmi_reboot_callback_11_p1, var_gsmi_reboot_callback_11_p2);
        }
        goto switch_break;
        case_7:
        {
        gsmi_die_callback(var_group4, var_gsmi_die_callback_12_p1, var_gsmi_die_callback_12_p2);
        }
        goto switch_break;
        case_8:
        {
        gsmi_panic_callback(var_group4, var_gsmi_panic_callback_13_p1, var_gsmi_panic_callback_13_p2);
        }
        goto switch_break;
        switch_default:
        goto switch_break;
      } else {
        switch_break: ;
      }
      }
    }
  }
  while_break: ;
  }
  {
  gsmi_exit();
  }
  ldv_final:
  {
  ldv_check_final_state();
  }
  return;
}
}
void ldv_blast_assert(void)
{
  {
  ERROR: {reach_error();abort();}
}
}
extern int __VERIFIER_nondet_int(void) ;
int ldv_mutex = 1;
int __attribute__((__warn_unused_result__)) mutex_lock_interruptible(struct mutex *lock )
{ int nondetermined ;
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  {
  nondetermined = __VERIFIER_nondet_int();
  }
  if (nondetermined) {
    ldv_mutex = 2;
    return (0);
  } else {
    return (-4);
  }
}
}
int __attribute__((__warn_unused_result__)) mutex_lock_killable(struct mutex *lock )
{ int nondetermined ;
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  {
  nondetermined = __VERIFIER_nondet_int();
  }
  if (nondetermined) {
    ldv_mutex = 2;
    return (0);
  } else {
    return (-4);
  }
}
}
int atomic_dec_and_mutex_lock(atomic_t *cnt , struct mutex *lock )
{ int atomic_value_after_dec ;
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  {
  atomic_value_after_dec = __VERIFIER_nondet_int();
  }
  if (atomic_value_after_dec == 0) {
    ldv_mutex = 2;
    return (1);
  } else {
  }
  return (0);
}
}
void mutex_lock(struct mutex *lock )
{
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  ldv_mutex = 2;
  return;
}
}
int mutex_trylock(struct mutex *lock )
{ int nondetermined ;
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  {
  nondetermined = __VERIFIER_nondet_int();
  }
  if (nondetermined) {
    ldv_mutex = 2;
    return (1);
  } else {
    return (0);
  }
}
}
void mutex_unlock(struct mutex *lock )
{
  {
  if (ldv_mutex == 2) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  ldv_mutex = 1;
  return;
}
}
void ldv_check_final_state(void)
{
  {
  if (ldv_mutex == 1) {
  } else {
    {
    ldv_blast_assert();
    }
  }
  return;
}
}
long ldv__builtin_expect(long val , long res )
{
  {
  return (val);
}
}
unsigned long __VERIFIER_nondet_ulong(void);
unsigned long int __phys_addr(unsigned long arg0) {
  return __VERIFIER_nondet_ulong();
}
void __raw_spin_lock_init(raw_spinlock_t *arg0, const char *arg1, struct lock_class_key *arg2) {
  return;
}
unsigned long __VERIFIER_nondet_ulong(void);
unsigned long int _raw_spin_lock_irqsave(raw_spinlock_t *arg0) {
  return __VERIFIER_nondet_ulong();
}
void _raw_spin_unlock_irqrestore(raw_spinlock_t *arg0, unsigned long arg1) {
  return;
}
int __VERIFIER_nondet_int(void);
int atomic_notifier_chain_register(struct atomic_notifier_head *arg0, struct notifier_block *arg1) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int atomic_notifier_chain_unregister(struct atomic_notifier_head *arg0, struct notifier_block *arg1) {
  return __VERIFIER_nondet_int();
}
void *dma_pool_alloc(struct dma_pool *arg0, gfp_t arg1, dma_addr_t *arg2) {
  return ldv_malloc(0UL);
}
struct dma_pool *dma_pool_create(const char *arg0, struct device *arg1, size_t arg2, size_t arg3, size_t arg4) {
  return ldv_malloc(0UL);
}
void dma_pool_destroy(struct dma_pool *arg0) {
  return;
}
void dma_pool_free(struct dma_pool *arg0, void *arg1, dma_addr_t arg2) {
  return;
}
int __VERIFIER_nondet_int(void);
int dmi_check_system(const struct dmi_system_id *arg0) {
  return __VERIFIER_nondet_int();
}
const char *dmi_get_system_info(int arg0) {
  return ldv_malloc(sizeof(char));
}
struct kobject *kobject_create_and_add(const char *arg0, struct kobject *arg1) {
  return ldv_malloc(sizeof(struct kobject));
}
void kobject_put(struct kobject *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int kstrtoull(const char *arg0, unsigned int arg1, unsigned long long *arg2) {
  return __VERIFIER_nondet_int();
}
void ldv_initialize() {
  return;
}
struct platform_device *platform_device_register_full(const struct platform_device_info *arg0) {
  return ldv_malloc(sizeof(struct platform_device));
}
void platform_device_unregister(struct platform_device *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int printk(const char *arg0, ...) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int register_die_notifier(struct notifier_block *arg0) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int register_efivars(struct efivars *arg0, const struct efivar_operations *arg1, struct kobject *arg2) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int register_reboot_notifier(struct notifier_block *arg0) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int sysfs_create_bin_file(struct kobject *arg0, const struct bin_attribute *arg1) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int sysfs_create_files(struct kobject *arg0, const struct attribute **arg1) {
  return __VERIFIER_nondet_int();
}
void sysfs_remove_bin_file(struct kobject *arg0, const struct bin_attribute *arg1) {
  return;
}
void sysfs_remove_files(struct kobject *arg0, const struct attribute **arg1) {
  return;
}
int __VERIFIER_nondet_int(void);
int unregister_die_notifier(struct notifier_block *arg0) {
  return __VERIFIER_nondet_int();
}
void unregister_efivars(struct efivars *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int unregister_reboot_notifier(struct notifier_block *arg0) {
  return __VERIFIER_nondet_int();
}
void free(void *);
void kfree(void const *p) {
  free((void *)p);
}
int _kstrtoul(const char *arg0, unsigned int arg1, unsigned long *arg2) {
  return __VERIFIER_nondet_int();
}
