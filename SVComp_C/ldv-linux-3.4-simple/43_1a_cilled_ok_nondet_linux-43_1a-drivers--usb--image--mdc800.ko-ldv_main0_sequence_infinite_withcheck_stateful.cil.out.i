extern void abort(void);

extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));

void reach_error() { ((void) sizeof ((0) ? 1 : 0), __extension__ ({ if (0) ; else __assert_fail ("0", "43_1a_cilled_ok_nondet_linux-43_1a-drivers--usb--image--mdc800.ko-ldv_main0_sequence_infinite_withcheck_stateful.cil.out.c", 3, __extension__ __PRETTY_FUNCTION__); })); }
typedef signed char __s8;
typedef unsigned char __u8;
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
typedef __u16 __le16;
typedef __u32 __le32;
typedef unsigned int gfp_t;
typedef unsigned int fmode_t;
struct __anonstruct_atomic_t_6 {
   int counter ;
};
typedef struct __anonstruct_atomic_t_6 atomic_t;
struct __anonstruct_atomic64_t_7 {
   long counter ;
};
typedef struct __anonstruct_atomic64_t_7 atomic64_t;
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
   void (*func)(struct rcu_head * ) ;
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
struct pid;
struct pid;
struct timespec;
struct timespec;
struct compat_timespec;
struct compat_timespec;
struct __anonstruct_futex_9 {
   u32 *uaddr ;
   u32 val ;
   u32 flags ;
   u32 bitset ;
   u64 time ;
   u32 *uaddr2 ;
};
struct __anonstruct_nanosleep_10 {
   clockid_t clockid ;
   struct timespec *rmtp ;
   struct compat_timespec *compat_rmtp ;
   u64 expires ;
};
struct pollfd;
struct __anonstruct_poll_11 {
   struct pollfd *ufds ;
   int nfds ;
   int has_timeout ;
   unsigned long tv_sec ;
   unsigned long tv_nsec ;
};
union __anonunion_ldv_2046_8 {
   struct __anonstruct_futex_9 futex ;
   struct __anonstruct_nanosleep_10 nanosleep ;
   struct __anonstruct_poll_11 poll ;
};
struct restart_block {
   long (*fn)(struct restart_block * ) ;
   union __anonunion_ldv_2046_8 ldv_2046 ;
};
struct page;
struct page;
struct task_struct;
struct task_struct;
struct exec_domain;
struct exec_domain;
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
struct __anonstruct_ldv_2180_13 {
   unsigned int a ;
   unsigned int b ;
};
struct __anonstruct_ldv_2195_14 {
   u16 limit0 ;
   u16 base0 ;
   unsigned char base1 ;
   unsigned char type : 4 ;
   unsigned char s : 1 ;
   unsigned char dpl : 2 ;
   unsigned char p : 1 ;
   unsigned char limit : 4 ;
   unsigned char avl : 1 ;
   unsigned char l : 1 ;
   unsigned char d : 1 ;
   unsigned char g : 1 ;
   unsigned char base2 ;
};
union __anonunion_ldv_2196_12 {
   struct __anonstruct_ldv_2180_13 ldv_2180 ;
   struct __anonstruct_ldv_2195_14 ldv_2195 ;
};
struct desc_struct {
   union __anonunion_ldv_2196_12 ldv_2196 ;
};
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
typedef struct page *pgtable_t;
struct file;
struct file;
struct seq_file;
struct seq_file;
struct thread_struct;
struct thread_struct;
struct cpumask;
struct cpumask;
struct arch_spinlock;
struct arch_spinlock;
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
union __anonunion_ldv_2824_19 {
   struct pt_regs *regs ;
   struct kernel_vm86_regs *vm86 ;
};
struct math_emu_info {
   long ___orig_eip ;
   union __anonunion_ldv_2824_19 ldv_2824 ;
};
struct bug_entry {
   int bug_addr_disp ;
   int file_disp ;
   unsigned short line ;
   unsigned short flags ;
};
struct cpumask {
   unsigned long bits[64U] ;
};
typedef struct cpumask cpumask_t;
typedef struct cpumask *cpumask_var_t;
struct static_key;
struct static_key;
struct map_segment;
struct exec_domain {
   char const *name ;
   void (*handler)(int , struct pt_regs * ) ;
   unsigned char pers_low ;
   unsigned char pers_high ;
   unsigned long *signal_map ;
   unsigned long *signal_invmap ;
   struct map_segment *err_map ;
   struct map_segment *socktype_map ;
   struct map_segment *sockopt_map ;
   struct map_segment *af_map ;
   struct module *module ;
   struct exec_domain *next ;
};
struct i387_fsave_struct {
   u32 cwd ;
   u32 swd ;
   u32 twd ;
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
   u32 st_space[20U] ;
   u32 status ;
};
struct __anonstruct_ldv_5180_24 {
   u64 rip ;
   u64 rdp ;
};
struct __anonstruct_ldv_5186_25 {
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
};
union __anonunion_ldv_5187_23 {
   struct __anonstruct_ldv_5180_24 ldv_5180 ;
   struct __anonstruct_ldv_5186_25 ldv_5186 ;
};
union __anonunion_ldv_5196_26 {
   u32 padding1[12U] ;
   u32 sw_reserved[12U] ;
};
struct i387_fxsave_struct {
   u16 cwd ;
   u16 swd ;
   u16 twd ;
   u16 fop ;
   union __anonunion_ldv_5187_23 ldv_5187 ;
   u32 mxcsr ;
   u32 mxcsr_mask ;
   u32 st_space[32U] ;
   u32 xmm_space[64U] ;
   u32 padding[12U] ;
   union __anonunion_ldv_5196_26 ldv_5196 ;
};
struct i387_soft_struct {
   u32 cwd ;
   u32 swd ;
   u32 twd ;
   u32 fip ;
   u32 fcs ;
   u32 foo ;
   u32 fos ;
   u32 st_space[20U] ;
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
   u32 ymmh_space[64U] ;
};
struct xsave_hdr_struct {
   u64 xstate_bv ;
   u64 reserved1[2U] ;
   u64 reserved2[5U] ;
};
struct xsave_struct {
   struct i387_fxsave_struct i387 ;
   struct xsave_hdr_struct xsave_hdr ;
   struct ymmh_struct ymmh ;
};
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
   struct desc_struct tls_array[3U] ;
   unsigned long sp0 ;
   unsigned long sp ;
   unsigned long usersp ;
   unsigned short es ;
   unsigned short ds ;
   unsigned short fsindex ;
   unsigned short gsindex ;
   unsigned long fs ;
   unsigned long gs ;
   struct perf_event *ptrace_bps[4U] ;
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
struct __anonstruct_mm_segment_t_28 {
   unsigned long seg ;
};
typedef struct __anonstruct_mm_segment_t_28 mm_segment_t;
typedef atomic64_t atomic_long_t;
struct thread_info {
   struct task_struct *task ;
   struct exec_domain *exec_domain ;
   __u32 flags ;
   __u32 status ;
   __u32 cpu ;
   int preempt_count ;
   mm_segment_t addr_limit ;
   struct restart_block restart_block ;
   void *sysenter_return ;
   unsigned char sig_on_uaccess_error : 1 ;
   unsigned char uaccess_err : 1 ;
};
typedef u16 __ticket_t;
typedef u32 __ticketpair_t;
struct __raw_tickets {
   __ticket_t head ;
   __ticket_t tail ;
};
union __anonunion_ldv_5907_29 {
   __ticketpair_t head_tail ;
   struct __raw_tickets tickets ;
};
struct arch_spinlock {
   union __anonunion_ldv_5907_29 ldv_5907 ;
};
typedef struct arch_spinlock arch_spinlock_t;
struct __anonstruct_ldv_5914_31 {
   u32 read ;
   s32 write ;
};
union __anonunion_arch_rwlock_t_30 {
   s64 lock ;
   struct __anonstruct_ldv_5914_31 ldv_5914 ;
};
typedef union __anonunion_arch_rwlock_t_30 arch_rwlock_t;
struct lockdep_map;
struct lockdep_map;
struct stack_trace {
   unsigned int nr_entries ;
   unsigned int max_entries ;
   unsigned long *entries ;
   int skip ;
};
struct lockdep_subclass_key {
   char __one_byte ;
};
struct lock_class_key {
   struct lockdep_subclass_key subkeys[8U] ;
};
struct lock_class {
   struct list_head hash_entry ;
   struct list_head lock_entry ;
   struct lockdep_subclass_key *key ;
   unsigned int subclass ;
   unsigned int dep_gen_id ;
   unsigned long usage_mask ;
   struct stack_trace usage_traces[13U] ;
   struct list_head locks_after ;
   struct list_head locks_before ;
   unsigned int version ;
   unsigned long ops ;
   char const *name ;
   int name_version ;
   unsigned long contention_point[4U] ;
   unsigned long contending_point[4U] ;
};
struct lockdep_map {
   struct lock_class_key *key ;
   struct lock_class *class_cache[2U] ;
   char const *name ;
   int cpu ;
   unsigned long ip ;
};
struct held_lock {
   u64 prev_chain_key ;
   unsigned long acquire_ip ;
   struct lockdep_map *instance ;
   struct lockdep_map *nest_lock ;
   u64 waittime_stamp ;
   u64 holdtime_stamp ;
   unsigned short class_idx : 13 ;
   unsigned char irq_context : 2 ;
   unsigned char trylock : 1 ;
   unsigned char read : 2 ;
   unsigned char check : 2 ;
   unsigned char hardirqs_off : 1 ;
   unsigned short references : 11 ;
};
struct raw_spinlock {
   arch_spinlock_t raw_lock ;
   unsigned int magic ;
   unsigned int owner_cpu ;
   void *owner ;
   struct lockdep_map dep_map ;
};
typedef struct raw_spinlock raw_spinlock_t;
struct __anonstruct_ldv_6122_33 {
   u8 __padding[24U] ;
   struct lockdep_map dep_map ;
};
union __anonunion_ldv_6123_32 {
   struct raw_spinlock rlock ;
   struct __anonstruct_ldv_6122_33 ldv_6122 ;
};
struct spinlock {
   union __anonunion_ldv_6123_32 ldv_6123 ;
};
typedef struct spinlock spinlock_t;
struct __anonstruct_rwlock_t_34 {
   arch_rwlock_t raw_lock ;
   unsigned int magic ;
   unsigned int owner_cpu ;
   void *owner ;
   struct lockdep_map dep_map ;
};
typedef struct __anonstruct_rwlock_t_34 rwlock_t;
struct seqcount {
   unsigned int sequence ;
};
typedef struct seqcount seqcount_t;
struct timespec {
   __kernel_time_t tv_sec ;
   long tv_nsec ;
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
struct __wait_queue;
typedef struct __wait_queue wait_queue_t;
struct __wait_queue {
   unsigned int flags ;
   void *private ;
   int (*func)(wait_queue_t * , unsigned int , int , void * ) ;
   struct list_head task_list ;
};
struct __wait_queue_head {
   spinlock_t lock ;
   struct list_head task_list ;
};
typedef struct __wait_queue_head wait_queue_head_t;
struct __anonstruct_nodemask_t_36 {
   unsigned long bits[16U] ;
};
typedef struct __anonstruct_nodemask_t_36 nodemask_t;
struct mutex {
   atomic_t count ;
   spinlock_t wait_lock ;
   struct list_head wait_list ;
   struct task_struct *owner ;
   char const *name ;
   void *magic ;
   struct lockdep_map dep_map ;
};
struct mutex_waiter {
   struct list_head list ;
   struct task_struct *task ;
   void *magic ;
};
struct rw_semaphore;
struct rw_semaphore;
struct rw_semaphore {
   long count ;
   raw_spinlock_t wait_lock ;
   struct list_head wait_list ;
   struct lockdep_map dep_map ;
};
struct completion {
   unsigned int done ;
   wait_queue_head_t wait ;
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
   char start_comm[16U] ;
   struct lockdep_map lockdep_map ;
};
struct hrtimer;
struct hrtimer;
enum hrtimer_restart;
struct work_struct;
struct work_struct;
struct work_struct {
   atomic_long_t data ;
   struct list_head entry ;
   void (*func)(struct work_struct * ) ;
   struct lockdep_map lockdep_map ;
};
struct delayed_work {
   struct work_struct work ;
   struct timer_list timer ;
};
struct pm_message {
   int event ;
};
typedef struct pm_message pm_message_t;
struct dev_pm_ops {
   int (*prepare)(struct device * ) ;
   void (*complete)(struct device * ) ;
   int (*suspend)(struct device * ) ;
   int (*resume)(struct device * ) ;
   int (*freeze)(struct device * ) ;
   int (*thaw)(struct device * ) ;
   int (*poweroff)(struct device * ) ;
   int (*restore)(struct device * ) ;
   int (*suspend_late)(struct device * ) ;
   int (*resume_early)(struct device * ) ;
   int (*freeze_late)(struct device * ) ;
   int (*thaw_early)(struct device * ) ;
   int (*poweroff_late)(struct device * ) ;
   int (*restore_early)(struct device * ) ;
   int (*suspend_noirq)(struct device * ) ;
   int (*resume_noirq)(struct device * ) ;
   int (*freeze_noirq)(struct device * ) ;
   int (*thaw_noirq)(struct device * ) ;
   int (*poweroff_noirq)(struct device * ) ;
   int (*restore_noirq)(struct device * ) ;
   int (*runtime_suspend)(struct device * ) ;
   int (*runtime_resume)(struct device * ) ;
   int (*runtime_idle)(struct device * ) ;
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
   unsigned char can_wakeup : 1 ;
   unsigned char async_suspend : 1 ;
   bool is_prepared ;
   bool is_suspended ;
   bool ignore_children ;
   spinlock_t lock ;
   struct list_head entry ;
   struct completion completion ;
   struct wakeup_source *wakeup ;
   bool wakeup_path ;
   struct timer_list suspend_timer ;
   unsigned long timer_expires ;
   struct work_struct work ;
   wait_queue_head_t wait_queue ;
   atomic_t usage_count ;
   atomic_t child_count ;
   unsigned char disable_depth : 3 ;
   unsigned char idle_notification : 1 ;
   unsigned char request_pending : 1 ;
   unsigned char deferred_resume : 1 ;
   unsigned char run_wake : 1 ;
   unsigned char runtime_auto : 1 ;
   unsigned char no_callbacks : 1 ;
   unsigned char irq_safe : 1 ;
   unsigned char use_autosuspend : 1 ;
   unsigned char timer_autosuspends : 1 ;
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
struct __anonstruct_mm_context_t_101 {
   void *ldt ;
   int size ;
   unsigned short ia32_compat ;
   struct mutex lock ;
   void *vdso ;
};
typedef struct __anonstruct_mm_context_t_101 mm_context_t;
struct vm_area_struct;
struct vm_area_struct;
struct rb_node {
   unsigned long rb_parent_color ;
   struct rb_node *rb_right ;
   struct rb_node *rb_left ;
};
struct rb_root {
   struct rb_node *rb_node ;
};
struct nsproxy;
struct nsproxy;
struct cred;
struct cred;
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
   void const *(*netlink_ns)(struct sock * ) ;
   void const *(*initial_ns)(void) ;
   void (*drop_ns)(void * ) ;
};
struct attribute {
   char const *name ;
   umode_t mode ;
   struct lock_class_key *key ;
   struct lock_class_key skey ;
};
struct attribute_group {
   char const *name ;
   umode_t (*is_visible)(struct kobject * , struct attribute * , int ) ;
   struct attribute **attrs ;
};
struct bin_attribute {
   struct attribute attr ;
   size_t size ;
   void *private ;
   ssize_t (*read)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                   loff_t , size_t ) ;
   ssize_t (*write)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                    loff_t , size_t ) ;
   int (*mmap)(struct file * , struct kobject * , struct bin_attribute * , struct vm_area_struct * ) ;
};
struct sysfs_ops {
   ssize_t (*show)(struct kobject * , struct attribute * , char * ) ;
   ssize_t (*store)(struct kobject * , struct attribute * , char const * , size_t ) ;
   void const *(*namespace)(struct kobject * , struct attribute const * ) ;
};
struct sysfs_dirent;
struct sysfs_dirent;
struct kref {
   atomic_t refcount ;
};
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
   unsigned char state_initialized : 1 ;
   unsigned char state_in_sysfs : 1 ;
   unsigned char state_add_uevent_sent : 1 ;
   unsigned char state_remove_uevent_sent : 1 ;
   unsigned char uevent_suppress : 1 ;
};
struct kobj_type {
   void (*release)(struct kobject * ) ;
   struct sysfs_ops const *sysfs_ops ;
   struct attribute **default_attrs ;
   struct kobj_ns_type_operations const *(*child_ns_type)(struct kobject * ) ;
   void const *(*namespace)(struct kobject * ) ;
};
struct kobj_uevent_env {
   char *envp[32U] ;
   int envp_idx ;
   char buf[2048U] ;
   int buflen ;
};
struct kset_uevent_ops {
   int (* const filter)(struct kset * , struct kobject * ) ;
   char const *(* const name)(struct kset * , struct kobject * ) ;
   int (* const uevent)(struct kset * , struct kobject * , struct kobj_uevent_env * ) ;
};
struct kset {
   struct list_head list ;
   spinlock_t list_lock ;
   struct kobject kobj ;
   struct kset_uevent_ops const *uevent_ops ;
};
struct kernel_param;
struct kernel_param;
struct kernel_param_ops {
   int (*set)(char const * , struct kernel_param const * ) ;
   int (*get)(char * , struct kernel_param const * ) ;
   void (*free)(void * ) ;
};
struct kparam_string;
struct kparam_array;
union __anonunion_ldv_13363_134 {
   void *arg ;
   struct kparam_string const *str ;
   struct kparam_array const *arr ;
};
struct kernel_param {
   char const *name ;
   struct kernel_param_ops const *ops ;
   u16 perm ;
   s16 level ;
   union __anonunion_ldv_13363_134 ldv_13363 ;
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
struct static_key {
   atomic_t enabled ;
};
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
                    size_t ) ;
   void (*setup)(struct module * , char const * ) ;
   int (*test)(struct module * ) ;
   void (*free)(struct module * ) ;
};
struct exception_table_entry;
struct exception_table_entry;
enum module_state {
    MODULE_STATE_LIVE = 0,
    MODULE_STATE_COMING = 1,
    MODULE_STATE_GOING = 2
} ;
struct module_ref {
   unsigned long incs ;
   unsigned long decs ;
};
struct module_sect_attrs;
struct module_notes_attrs;
struct ftrace_event_call;
struct module {
   enum module_state state ;
   struct list_head list ;
   char name[56U] ;
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
   ctor_fn_t (**ctors)(void) ;
   unsigned int num_ctors ;
};
struct kmem_cache_cpu {
   void **freelist ;
   unsigned long tid ;
   struct page *page ;
   struct page *partial ;
   int node ;
   unsigned int stat[26U] ;
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
   struct kmem_cache_node *node[1024U] ;
};
struct kernel_cap_struct {
   __u32 cap[2U] ;
};
typedef struct kernel_cap_struct kernel_cap_t;
struct dentry;
struct dentry;
struct user_namespace;
struct user_namespace;
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
struct address_space;
struct address_space;
union __anonunion_ldv_14345_137 {
   unsigned long index ;
   void *freelist ;
};
struct __anonstruct_ldv_14355_141 {
   unsigned short inuse ;
   unsigned short objects : 15 ;
   unsigned char frozen : 1 ;
};
union __anonunion_ldv_14356_140 {
   atomic_t _mapcount ;
   struct __anonstruct_ldv_14355_141 ldv_14355 ;
};
struct __anonstruct_ldv_14358_139 {
   union __anonunion_ldv_14356_140 ldv_14356 ;
   atomic_t _count ;
};
union __anonunion_ldv_14359_138 {
   unsigned long counters ;
   struct __anonstruct_ldv_14358_139 ldv_14358 ;
};
struct __anonstruct_ldv_14360_136 {
   union __anonunion_ldv_14345_137 ldv_14345 ;
   union __anonunion_ldv_14359_138 ldv_14359 ;
};
struct __anonstruct_ldv_14367_143 {
   struct page *next ;
   int pages ;
   int pobjects ;
};
union __anonunion_ldv_14368_142 {
   struct list_head lru ;
   struct __anonstruct_ldv_14367_143 ldv_14367 ;
};
union __anonunion_ldv_14373_144 {
   unsigned long private ;
   struct kmem_cache *slab ;
   struct page *first_page ;
};
struct page {
   unsigned long flags ;
   struct address_space *mapping ;
   struct __anonstruct_ldv_14360_136 ldv_14360 ;
   union __anonunion_ldv_14368_142 ldv_14368 ;
   union __anonunion_ldv_14373_144 ldv_14373 ;
   unsigned long debug_flags ;
};
struct __anonstruct_vm_set_146 {
   struct list_head list ;
   void *parent ;
   struct vm_area_struct *head ;
};
union __anonunion_shared_145 {
   struct __anonstruct_vm_set_146 vm_set ;
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
   union __anonunion_shared_145 shared ;
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
   atomic_long_t count[3U] ;
};
struct linux_binfmt;
struct mmu_notifier_mm;
struct mm_struct {
   struct vm_area_struct *mmap ;
   struct rb_root mm_rb ;
   struct vm_area_struct *mmap_cache ;
   unsigned long (*get_unmapped_area)(struct file * , unsigned long , unsigned long ,
                                      unsigned long , unsigned long ) ;
   void (*unmap_area)(struct mm_struct * , unsigned long ) ;
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
   unsigned long saved_auxv[44U] ;
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
typedef unsigned long cputime_t;
struct sem_undo_list;
struct sysv_sem {
   struct sem_undo_list *undo_list ;
};
struct siginfo;
struct siginfo;
struct __anonstruct_sigset_t_147 {
   unsigned long sig[1U] ;
};
typedef struct __anonstruct_sigset_t_147 sigset_t;
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
struct __anonstruct__kill_149 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
};
struct __anonstruct__timer_150 {
   __kernel_timer_t _tid ;
   int _overrun ;
   char _pad[0U] ;
   sigval_t _sigval ;
   int _sys_private ;
};
struct __anonstruct__rt_151 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
   sigval_t _sigval ;
};
struct __anonstruct__sigchld_152 {
   __kernel_pid_t _pid ;
   __kernel_uid32_t _uid ;
   int _status ;
   __kernel_clock_t _utime ;
   __kernel_clock_t _stime ;
};
struct __anonstruct__sigfault_153 {
   void *_addr ;
   short _addr_lsb ;
};
struct __anonstruct__sigpoll_154 {
   long _band ;
   int _fd ;
};
union __anonunion__sifields_148 {
   int _pad[28U] ;
   struct __anonstruct__kill_149 _kill ;
   struct __anonstruct__timer_150 _timer ;
   struct __anonstruct__rt_151 _rt ;
   struct __anonstruct__sigchld_152 _sigchld ;
   struct __anonstruct__sigfault_153 _sigfault ;
   struct __anonstruct__sigpoll_154 _sigpoll ;
};
struct siginfo {
   int si_signo ;
   int si_errno ;
   int si_code ;
   union __anonunion__sifields_148 _sifields ;
};
typedef struct siginfo siginfo_t;
struct user_struct;
struct sigpending {
   struct list_head list ;
   sigset_t signal ;
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
   struct hlist_head tasks[3U] ;
   struct rcu_head rcu ;
   struct upid numbers[1U] ;
};
struct pid_link {
   struct hlist_node node ;
   struct pid *pid ;
};
struct __anonstruct_seccomp_t_157 {
   int mode ;
};
typedef struct __anonstruct_seccomp_t_157 seccomp_t;
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
   char start_comm[16U] ;
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
   struct hrtimer_clock_base clock_base[3U] ;
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
struct latency_record {
   unsigned long backtrace[12U] ;
   unsigned int count ;
   unsigned long time ;
   unsigned long max ;
};
typedef int32_t key_serial_t;
typedef uint32_t key_perm_t;
struct key;
struct key;
struct signal_struct;
struct signal_struct;
struct key_type;
struct key_type;
struct keyring_list;
struct keyring_list;
struct key_user;
union __anonunion_ldv_15609_158 {
   time_t expiry ;
   time_t revoked_at ;
};
union __anonunion_type_data_159 {
   struct list_head link ;
   unsigned long x[2U] ;
   void *p[2U] ;
   int reject_error ;
};
union __anonunion_payload_160 {
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
   union __anonunion_ldv_15609_158 ldv_15609 ;
   uid_t uid ;
   gid_t gid ;
   key_perm_t perm ;
   unsigned short quotalen ;
   unsigned short datalen ;
   unsigned long flags ;
   char *description ;
   union __anonunion_type_data_159 type_data ;
   union __anonunion_payload_160 payload ;
};
struct audit_context;
struct audit_context;
struct inode;
struct inode;
struct group_info {
   atomic_t usage ;
   int ngroups ;
   int nblocks ;
   gid_t small_block[32U] ;
   gid_t *blocks[0U] ;
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
struct cfs_rq;
struct cfs_rq;
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
union __anonunion_ki_obj_161 {
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
   union __anonunion_ki_obj_161 ki_obj ;
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
   struct page *internal_pages[8U] ;
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
struct sighand_struct {
   atomic_t count ;
   struct k_sigaction action[64U] ;
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
   unsigned char is_child_subreaper : 1 ;
   unsigned char has_child_subreaper : 1 ;
   struct list_head posix_timers ;
   struct hrtimer real_timer ;
   struct pid *leader_pid ;
   ktime_t it_real_incr ;
   struct cpu_itimer it[2U] ;
   struct thread_group_cputimer cputimer ;
   struct task_cputime cputime_expires ;
   struct list_head cpu_timers[3U] ;
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
   struct rlimit rlim[16U] ;
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
struct pipe_inode_info;
struct pipe_inode_info;
struct rq;
struct rq;
struct sched_class {
   struct sched_class const *next ;
   void (*enqueue_task)(struct rq * , struct task_struct * , int ) ;
   void (*dequeue_task)(struct rq * , struct task_struct * , int ) ;
   void (*yield_task)(struct rq * ) ;
   bool (*yield_to_task)(struct rq * , struct task_struct * , bool ) ;
   void (*check_preempt_curr)(struct rq * , struct task_struct * , int ) ;
   struct task_struct *(*pick_next_task)(struct rq * ) ;
   void (*put_prev_task)(struct rq * , struct task_struct * ) ;
   int (*select_task_rq)(struct task_struct * , int , int ) ;
   void (*pre_schedule)(struct rq * , struct task_struct * ) ;
   void (*post_schedule)(struct rq * ) ;
   void (*task_waking)(struct task_struct * ) ;
   void (*task_woken)(struct rq * , struct task_struct * ) ;
   void (*set_cpus_allowed)(struct task_struct * , struct cpumask const * ) ;
   void (*rq_online)(struct rq * ) ;
   void (*rq_offline)(struct rq * ) ;
   void (*set_curr_task)(struct rq * ) ;
   void (*task_tick)(struct rq * , struct task_struct * , int ) ;
   void (*task_fork)(struct task_struct * ) ;
   void (*switched_from)(struct rq * , struct task_struct * ) ;
   void (*switched_to)(struct rq * , struct task_struct * ) ;
   void (*prio_changed)(struct rq * , struct task_struct * , int ) ;
   unsigned int (*get_rr_interval)(struct rq * , struct task_struct * ) ;
   void (*task_move_group)(struct task_struct * , int ) ;
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
struct mem_cgroup;
struct memcg_batch_info {
   int do_batch ;
   struct mem_cgroup *memcg ;
   unsigned long nr_pages ;
   unsigned long memsw_nr_pages ;
};
struct files_struct;
struct css_set;
struct compat_robust_list_head;
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
   unsigned char brk_randomized : 1 ;
   int exit_state ;
   int exit_code ;
   int exit_signal ;
   int pdeath_signal ;
   unsigned int jobctl ;
   unsigned int personality ;
   unsigned char did_exec : 1 ;
   unsigned char in_execve : 1 ;
   unsigned char in_iowait : 1 ;
   unsigned char sched_reset_on_fork : 1 ;
   unsigned char sched_contributes_to_load : 1 ;
   unsigned char irq_thread : 1 ;
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
   struct pid_link pids[3U] ;
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
   struct list_head cpu_timers[3U] ;
   struct cred const *real_cred ;
   struct cred const *cred ;
   struct cred *replacement_session_keyring ;
   char comm[16U] ;
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
   int (*notifier)(void * ) ;
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
   u64 curr_chain_key ;
   int lockdep_depth ;
   unsigned int lockdep_recursion ;
   struct held_lock held_locks[48U] ;
   gfp_t lockdep_reclaim_gfp ;
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
   struct perf_event_context *perf_event_ctxp[2U] ;
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
   struct latency_record latency_record[32U] ;
   unsigned long timer_slack_ns ;
   unsigned long default_timer_slack_ns ;
   struct list_head *scm_work_list ;
   unsigned long trace ;
   unsigned long trace_recursion ;
   struct memcg_batch_info memcg_batch ;
   atomic_t ptrace_bp_refcnt ;
};
struct pollfd {
   int fd ;
   short events ;
   short revents ;
};
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
union __anonunion_d_u_163 {
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
   unsigned char d_iname[32U] ;
   unsigned int d_count ;
   spinlock_t d_lock ;
   struct dentry_operations const *d_op ;
   struct super_block *d_sb ;
   unsigned long d_time ;
   void *d_fsdata ;
   struct list_head d_lru ;
   union __anonunion_d_u_163 d_u ;
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
};
struct path {
   struct vfsmount *mnt ;
   struct dentry *dentry ;
};
struct radix_tree_node;
struct radix_tree_root {
   unsigned int height ;
   gfp_t gfp_mask ;
   struct radix_tree_node *rnode ;
};
struct fiemap_extent {
   __u64 fe_logical ;
   __u64 fe_physical ;
   __u64 fe_length ;
   __u64 fe_reserved64[2U] ;
   __u32 fe_flags ;
   __u32 fe_reserved[3U] ;
};
struct shrink_control {
   gfp_t gfp_mask ;
   unsigned long nr_to_scan ;
};
struct shrinker {
   int (*shrink)(struct shrinker * , struct shrink_control * ) ;
   int seeks ;
   long batch ;
   struct list_head list ;
   atomic_long_t nr_in_batch ;
};
enum migrate_mode {
    MIGRATE_ASYNC = 0,
    MIGRATE_SYNC_LIGHT = 1,
    MIGRATE_SYNC = 2
} ;
struct export_operations;
struct export_operations;
struct poll_table_struct;
struct poll_table_struct;
struct kstatfs;
struct kstatfs;
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
   char d_padding4[8U] ;
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
   int (*check_quota_file)(struct super_block * , int ) ;
   int (*read_file_info)(struct super_block * , int ) ;
   int (*write_file_info)(struct super_block * , int ) ;
   int (*free_file_info)(struct super_block * , int ) ;
   int (*read_dqblk)(struct dquot * ) ;
   int (*commit_dqblk)(struct dquot * ) ;
   int (*release_dqblk)(struct dquot * ) ;
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
   struct inode *files[2U] ;
   struct mem_dqinfo info[2U] ;
   struct quota_format_ops const *ops[2U] ;
};
struct writeback_control;
struct writeback_control;
union __anonunion_arg_165 {
   char *buf ;
   void *data ;
};
struct __anonstruct_read_descriptor_t_164 {
   size_t written ;
   size_t count ;
   union __anonunion_arg_165 arg ;
   int error ;
};
typedef struct __anonstruct_read_descriptor_t_164 read_descriptor_t;
struct address_space_operations {
   int (*writepage)(struct page * , struct writeback_control * ) ;
   int (*readpage)(struct file * , struct page * ) ;
   int (*writepages)(struct address_space * , struct writeback_control * ) ;
   int (*set_page_dirty)(struct page * ) ;
   int (*readpages)(struct file * , struct address_space * , struct list_head * ,
                    unsigned int ) ;
   int (*write_begin)(struct file * , struct address_space * , loff_t , unsigned int ,
                      unsigned int , struct page ** , void ** ) ;
   int (*write_end)(struct file * , struct address_space * , loff_t , unsigned int ,
                    unsigned int , struct page * , void * ) ;
   sector_t (*bmap)(struct address_space * , sector_t ) ;
   void (*invalidatepage)(struct page * , unsigned long ) ;
   int (*releasepage)(struct page * , gfp_t ) ;
   void (*freepage)(struct page * ) ;
   ssize_t (*direct_IO)(int , struct kiocb * , struct iovec const * , loff_t ,
                        unsigned long ) ;
   int (*get_xip_mem)(struct address_space * , unsigned long , int , void ** , unsigned long * ) ;
   int (*migratepage)(struct address_space * , struct page * , struct page * , enum migrate_mode ) ;
   int (*launder_page)(struct page * ) ;
   int (*is_partially_uptodate)(struct page * , read_descriptor_t * , unsigned long ) ;
   int (*error_remove_page)(struct address_space * , struct page * ) ;
};
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
};
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
union __anonunion_ldv_18722_166 {
   unsigned int const i_nlink ;
   unsigned int __i_nlink ;
};
union __anonunion_ldv_18741_167 {
   struct list_head i_dentry ;
   struct rcu_head i_rcu ;
};
struct file_operations;
struct file_lock;
struct cdev;
union __anonunion_ldv_18759_168 {
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
   union __anonunion_ldv_18722_166 ldv_18722 ;
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
   union __anonunion_ldv_18741_167 ldv_18741 ;
   atomic_t i_count ;
   unsigned int i_blkbits ;
   u64 i_version ;
   atomic_t i_dio_count ;
   atomic_t i_writecount ;
   struct file_operations const *i_fop ;
   struct file_lock *i_flock ;
   struct address_space i_data ;
   struct dquot *i_dquot[2U] ;
   struct list_head i_devices ;
   union __anonunion_ldv_18759_168 ldv_18759 ;
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
union __anonunion_f_u_169 {
   struct list_head fu_list ;
   struct rcu_head fu_rcuhead ;
};
struct file {
   union __anonunion_f_u_169 f_u ;
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
struct __anonstruct_afs_171 {
   struct list_head link ;
   int state ;
};
union __anonunion_fl_u_170 {
   struct nfs_lock_info nfs_fl ;
   struct nfs4_lock_info nfs4_fl ;
   struct __anonstruct_afs_171 afs ;
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
   union __anonunion_fl_u_170 fl_u ;
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
   spinlock_t s_inode_lru_lock ;
   struct list_head s_inode_lru ;
   int s_nr_inodes_unused ;
   struct block_device *s_bdev ;
   struct backing_dev_info *s_bdi ;
   struct mtd_info *s_mtd ;
   struct hlist_node s_instances ;
   struct quota_info s_dquot ;
   int s_frozen ;
   wait_queue_head_t s_wait_unfrozen ;
   char s_id[32U] ;
   u8 s_uuid[16U] ;
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
   int (*flush)(struct file * , fl_owner_t ) ;
   int (*release)(struct inode * , struct file * ) ;
   int (*fsync)(struct file * , loff_t , loff_t , int ) ;
   int (*aio_fsync)(struct kiocb * , int ) ;
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
   long (*fallocate)(struct file * , int , loff_t , loff_t ) ;
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
   int (*getattr)(struct vfsmount * , struct dentry * , struct kstat * ) ;
   int (*setxattr)(struct dentry * , char const * , void const * , size_t , int ) ;
   ssize_t (*getxattr)(struct dentry * , char const * , void * , size_t ) ;
   ssize_t (*listxattr)(struct dentry * , char * , size_t ) ;
   int (*removexattr)(struct dentry * , char const * ) ;
   void (*truncate_range)(struct inode * , loff_t , loff_t ) ;
   int (*fiemap)(struct inode * , struct fiemap_extent_info * , u64 , u64 ) ;
};
struct super_operations {
   struct inode *(*alloc_inode)(struct super_block * ) ;
   void (*destroy_inode)(struct inode * ) ;
   void (*dirty_inode)(struct inode * , int ) ;
   int (*write_inode)(struct inode * , struct writeback_control * ) ;
   int (*drop_inode)(struct inode * ) ;
   void (*evict_inode)(struct inode * ) ;
   void (*put_super)(struct super_block * ) ;
   void (*write_super)(struct super_block * ) ;
   int (*sync_fs)(struct super_block * , int ) ;
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
struct exception_table_entry {
   unsigned long insn ;
   unsigned long fixup ;
};
struct poll_table_struct {
   void (*_qproc)(struct file * , wait_queue_head_t * , struct poll_table_struct * ) ;
   unsigned long _key ;
};
typedef unsigned long kernel_ulong_t;
struct usb_device_id {
   __u16 match_flags ;
   __u16 idVendor ;
   __u16 idProduct ;
   __u16 bcdDevice_lo ;
   __u16 bcdDevice_hi ;
   __u8 bDeviceClass ;
   __u8 bDeviceSubClass ;
   __u8 bDeviceProtocol ;
   __u8 bInterfaceClass ;
   __u8 bInterfaceSubClass ;
   __u8 bInterfaceProtocol ;
   kernel_ulong_t driver_info ;
};
struct of_device_id {
   char name[32U] ;
   char type[32U] ;
   char compatible[128U] ;
   void *data ;
};
struct usb_device_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __le16 bcdUSB ;
   __u8 bDeviceClass ;
   __u8 bDeviceSubClass ;
   __u8 bDeviceProtocol ;
   __u8 bMaxPacketSize0 ;
   __le16 idVendor ;
   __le16 idProduct ;
   __le16 bcdDevice ;
   __u8 iManufacturer ;
   __u8 iProduct ;
   __u8 iSerialNumber ;
   __u8 bNumConfigurations ;
};
struct usb_config_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __le16 wTotalLength ;
   __u8 bNumInterfaces ;
   __u8 bConfigurationValue ;
   __u8 iConfiguration ;
   __u8 bmAttributes ;
   __u8 bMaxPower ;
};
struct usb_interface_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bInterfaceNumber ;
   __u8 bAlternateSetting ;
   __u8 bNumEndpoints ;
   __u8 bInterfaceClass ;
   __u8 bInterfaceSubClass ;
   __u8 bInterfaceProtocol ;
   __u8 iInterface ;
};
struct usb_endpoint_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bEndpointAddress ;
   __u8 bmAttributes ;
   __le16 wMaxPacketSize ;
   __u8 bInterval ;
   __u8 bRefresh ;
   __u8 bSynchAddress ;
};
struct usb_ss_ep_comp_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bMaxBurst ;
   __u8 bmAttributes ;
   __le16 wBytesPerInterval ;
};
struct usb_interface_assoc_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bFirstInterface ;
   __u8 bInterfaceCount ;
   __u8 bFunctionClass ;
   __u8 bFunctionSubClass ;
   __u8 bFunctionProtocol ;
   __u8 iFunction ;
};
struct usb_bos_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __le16 wTotalLength ;
   __u8 bNumDeviceCaps ;
};
struct usb_ext_cap_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bDevCapabilityType ;
   __le32 bmAttributes ;
};
struct usb_ss_cap_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bDevCapabilityType ;
   __u8 bmAttributes ;
   __le16 wSpeedSupported ;
   __u8 bFunctionalitySupport ;
   __u8 bU1devExitLat ;
   __le16 bU2DevExitLat ;
};
struct usb_ss_container_id_descriptor {
   __u8 bLength ;
   __u8 bDescriptorType ;
   __u8 bDevCapabilityType ;
   __u8 bReserved ;
   __u8 ContainerID[16U] ;
};
enum usb_device_speed {
    USB_SPEED_UNKNOWN = 0,
    USB_SPEED_LOW = 1,
    USB_SPEED_FULL = 2,
    USB_SPEED_HIGH = 3,
    USB_SPEED_WIRELESS = 4,
    USB_SPEED_SUPER = 5
} ;
enum usb_device_state {
    USB_STATE_NOTATTACHED = 0,
    USB_STATE_ATTACHED = 1,
    USB_STATE_POWERED = 2,
    USB_STATE_RECONNECTING = 3,
    USB_STATE_UNAUTHENTICATED = 4,
    USB_STATE_DEFAULT = 5,
    USB_STATE_ADDRESS = 6,
    USB_STATE_CONFIGURED = 7,
    USB_STATE_SUSPENDED = 8
} ;
struct klist_node;
struct klist_node;
struct klist_node {
   void *n_klist ;
   struct list_head n_node ;
   struct kref n_ref ;
};
struct dma_map_ops;
struct dev_archdata {
   void *acpi_handle ;
   struct dma_map_ops *dma_ops ;
   void *iommu ;
};
struct device_private;
struct device_private;
struct device_driver;
struct device_driver;
struct driver_private;
struct driver_private;
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
   ssize_t (*show)(struct bus_type * , char * ) ;
   ssize_t (*store)(struct bus_type * , char const * , size_t ) ;
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
   int (*match)(struct device * , struct device_driver * ) ;
   int (*uevent)(struct device * , struct kobj_uevent_env * ) ;
   int (*probe)(struct device * ) ;
   int (*remove)(struct device * ) ;
   void (*shutdown)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct dev_pm_ops const *pm ;
   struct iommu_ops *iommu_ops ;
   struct subsys_private *p ;
};
struct device_type;
struct device_driver {
   char const *name ;
   struct bus_type *bus ;
   struct module *owner ;
   char const *mod_name ;
   bool suppress_bind_attrs ;
   struct of_device_id const *of_match_table ;
   int (*probe)(struct device * ) ;
   int (*remove)(struct device * ) ;
   void (*shutdown)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct attribute_group const **groups ;
   struct dev_pm_ops const *pm ;
   struct driver_private *p ;
};
struct driver_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct device_driver * , char * ) ;
   ssize_t (*store)(struct device_driver * , char const * , size_t ) ;
};
struct class_attribute;
struct class {
   char const *name ;
   struct module *owner ;
   struct class_attribute *class_attrs ;
   struct device_attribute *dev_attrs ;
   struct bin_attribute *dev_bin_attrs ;
   struct kobject *dev_kobj ;
   int (*dev_uevent)(struct device * , struct kobj_uevent_env * ) ;
   char *(*devnode)(struct device * , umode_t * ) ;
   void (*class_release)(struct class * ) ;
   void (*dev_release)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct kobj_ns_type_operations const *ns_type ;
   void const *(*namespace)(struct device * ) ;
   struct dev_pm_ops const *pm ;
   struct subsys_private *p ;
};
struct class_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct class * , struct class_attribute * , char * ) ;
   ssize_t (*store)(struct class * , struct class_attribute * , char const * , size_t ) ;
   void const *(*namespace)(struct class * , struct class_attribute const * ) ;
};
struct device_type {
   char const *name ;
   struct attribute_group const **groups ;
   int (*uevent)(struct device * , struct kobj_uevent_env * ) ;
   char *(*devnode)(struct device * , umode_t * ) ;
   void (*release)(struct device * ) ;
   struct dev_pm_ops const *pm ;
};
struct device_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct device * , struct device_attribute * , char * ) ;
   ssize_t (*store)(struct device * , struct device_attribute * , char const * ,
                    size_t ) ;
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
   void (*release)(struct device * ) ;
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
   unsigned char active : 1 ;
};
struct usb_device;
struct usb_device;
struct usb_driver;
struct usb_driver;
struct wusb_dev;
struct wusb_dev;
struct ep_device;
struct ep_device;
struct usb_host_endpoint {
   struct usb_endpoint_descriptor desc ;
   struct usb_ss_ep_comp_descriptor ss_ep_comp ;
   struct list_head urb_list ;
   void *hcpriv ;
   struct ep_device *ep_dev ;
   unsigned char *extra ;
   int extralen ;
   int enabled ;
};
struct usb_host_interface {
   struct usb_interface_descriptor desc ;
   struct usb_host_endpoint *endpoint ;
   char *string ;
   unsigned char *extra ;
   int extralen ;
};
enum usb_interface_condition {
    USB_INTERFACE_UNBOUND = 0,
    USB_INTERFACE_BINDING = 1,
    USB_INTERFACE_BOUND = 2,
    USB_INTERFACE_UNBINDING = 3
} ;
struct usb_interface {
   struct usb_host_interface *altsetting ;
   struct usb_host_interface *cur_altsetting ;
   unsigned int num_altsetting ;
   struct usb_interface_assoc_descriptor *intf_assoc ;
   int minor ;
   enum usb_interface_condition condition ;
   unsigned char sysfs_files_created : 1 ;
   unsigned char ep_devs_created : 1 ;
   unsigned char unregistering : 1 ;
   unsigned char needs_remote_wakeup : 1 ;
   unsigned char needs_altsetting0 : 1 ;
   unsigned char needs_binding : 1 ;
   unsigned char reset_running : 1 ;
   unsigned char resetting_device : 1 ;
   struct device dev ;
   struct device *usb_dev ;
   atomic_t pm_usage_cnt ;
   struct work_struct reset_ws ;
};
struct usb_interface_cache {
   unsigned int num_altsetting ;
   struct kref ref ;
   struct usb_host_interface altsetting[0U] ;
};
struct usb_host_config {
   struct usb_config_descriptor desc ;
   char *string ;
   struct usb_interface_assoc_descriptor *intf_assoc[16U] ;
   struct usb_interface *interface[32U] ;
   struct usb_interface_cache *intf_cache[32U] ;
   unsigned char *extra ;
   int extralen ;
};
struct usb_host_bos {
   struct usb_bos_descriptor *desc ;
   struct usb_ext_cap_descriptor *ext_cap ;
   struct usb_ss_cap_descriptor *ss_cap ;
   struct usb_ss_container_id_descriptor *ss_id ;
};
struct usb_devmap {
   unsigned long devicemap[2U] ;
};
struct mon_bus;
struct usb_bus {
   struct device *controller ;
   int busnum ;
   char const *bus_name ;
   u8 uses_dma ;
   u8 uses_pio_for_control ;
   u8 otg_port ;
   unsigned char is_b_host : 1 ;
   unsigned char b_hnp_enable : 1 ;
   unsigned int sg_tablesize ;
   int devnum_next ;
   struct usb_devmap devmap ;
   struct usb_device *root_hub ;
   struct usb_bus *hs_companion ;
   struct list_head bus_list ;
   int bandwidth_allocated ;
   int bandwidth_int_reqs ;
   int bandwidth_isoc_reqs ;
   struct dentry *usbfs_dentry ;
   struct mon_bus *mon_bus ;
   int monitored ;
};
struct usb_tt;
struct usb_tt;
enum usb_device_removable {
    USB_DEVICE_REMOVABLE_UNKNOWN = 0,
    USB_DEVICE_REMOVABLE = 1,
    USB_DEVICE_FIXED = 2
} ;
struct usb_device {
   int devnum ;
   char devpath[16U] ;
   u32 route ;
   enum usb_device_state state ;
   enum usb_device_speed speed ;
   struct usb_tt *tt ;
   int ttport ;
   unsigned int toggle[2U] ;
   struct usb_device *parent ;
   struct usb_bus *bus ;
   struct usb_host_endpoint ep0 ;
   struct device dev ;
   struct usb_device_descriptor descriptor ;
   struct usb_host_bos *bos ;
   struct usb_host_config *config ;
   struct usb_host_config *actconfig ;
   struct usb_host_endpoint *ep_in[16U] ;
   struct usb_host_endpoint *ep_out[16U] ;
   char **rawdescriptors ;
   unsigned short bus_mA ;
   u8 portnum ;
   u8 level ;
   unsigned char can_submit : 1 ;
   unsigned char persist_enabled : 1 ;
   unsigned char have_langid : 1 ;
   unsigned char authorized : 1 ;
   unsigned char authenticated : 1 ;
   unsigned char wusb : 1 ;
   unsigned char lpm_capable : 1 ;
   unsigned char usb2_hw_lpm_capable : 1 ;
   unsigned char usb2_hw_lpm_enabled : 1 ;
   int string_langid ;
   char *product ;
   char *manufacturer ;
   char *serial ;
   struct list_head filelist ;
   struct device *usb_classdev ;
   struct dentry *usbfs_dentry ;
   int maxchild ;
   struct usb_device **children ;
   u32 quirks ;
   atomic_t urbnum ;
   unsigned long active_duration ;
   unsigned long connect_time ;
   unsigned char do_remote_wakeup : 1 ;
   unsigned char reset_resume : 1 ;
   struct wusb_dev *wusb_dev ;
   int slot_id ;
   enum usb_device_removable removable ;
};
struct usb_dynids {
   spinlock_t lock ;
   struct list_head list ;
};
struct usbdrv_wrap {
   struct device_driver driver ;
   int for_devices ;
};
struct usb_driver {
   char const *name ;
   int (*probe)(struct usb_interface * , struct usb_device_id const * ) ;
   void (*disconnect)(struct usb_interface * ) ;
   int (*unlocked_ioctl)(struct usb_interface * , unsigned int , void * ) ;
   int (*suspend)(struct usb_interface * , pm_message_t ) ;
   int (*resume)(struct usb_interface * ) ;
   int (*reset_resume)(struct usb_interface * ) ;
   int (*pre_reset)(struct usb_interface * ) ;
   int (*post_reset)(struct usb_interface * ) ;
   struct usb_device_id const *id_table ;
   struct usb_dynids dynids ;
   struct usbdrv_wrap drvwrap ;
   unsigned char no_dynamic_id : 1 ;
   unsigned char supports_autosuspend : 1 ;
   unsigned char soft_unbind : 1 ;
};
struct usb_class_driver {
   char *name ;
   char *(*devnode)(struct device * , umode_t * ) ;
   struct file_operations const *fops ;
   int minor_base ;
};
struct usb_iso_packet_descriptor {
   unsigned int offset ;
   unsigned int length ;
   unsigned int actual_length ;
   int status ;
};
struct urb;
struct urb;
struct usb_anchor {
   struct list_head urb_list ;
   wait_queue_head_t wait ;
   spinlock_t lock ;
   unsigned char poisoned : 1 ;
};
struct scatterlist;
struct urb {
   struct kref kref ;
   void *hcpriv ;
   atomic_t use_count ;
   atomic_t reject ;
   int unlinked ;
   struct list_head urb_list ;
   struct list_head anchor_list ;
   struct usb_anchor *anchor ;
   struct usb_device *dev ;
   struct usb_host_endpoint *ep ;
   unsigned int pipe ;
   unsigned int stream_id ;
   int status ;
   unsigned int transfer_flags ;
   void *transfer_buffer ;
   dma_addr_t transfer_dma ;
   struct scatterlist *sg ;
   int num_mapped_sgs ;
   int num_sgs ;
   u32 transfer_buffer_length ;
   u32 actual_length ;
   unsigned char *setup_packet ;
   dma_addr_t setup_dma ;
   int start_frame ;
   int number_of_packets ;
   int interval ;
   int error_count ;
   void *context ;
   void (*complete)(struct urb * ) ;
   struct usb_iso_packet_descriptor iso_frame_desc[0U] ;
};
enum ldv_19054 {
    NOT_CONNECTED = 0,
    READY = 1,
    WORKING = 2,
    DOWNLOAD = 3
} ;
typedef enum ldv_19054 mdc800_state;
struct mdc800_data {
   struct usb_device *dev ;
   mdc800_state state ;
   unsigned int endpoint[4U] ;
   struct urb *irq_urb ;
   wait_queue_head_t irq_wait ;
   int irq_woken ;
   char *irq_urb_buffer ;
   int camera_busy ;
   int camera_request_ready ;
   char camera_response[8U] ;
   struct urb *write_urb ;
   char *write_urb_buffer ;
   wait_queue_head_t write_wait ;
   int written ;
   struct urb *download_urb ;
   char *download_urb_buffer ;
   wait_queue_head_t download_wait ;
   int downloaded ;
   int download_left ;
   char out[64U] ;
   int out_ptr ;
   int out_count ;
   int open ;
   struct mutex io_lock ;
   char in[8U] ;
   int in_count ;
   int pic_index ;
   int pic_len ;
   int minor ;
};
void ldv_spin_lock(void) ;
void ldv_spin_unlock(void) ;
int ldv_spin_trylock(void) ;
__inline static int variable_test_bit(int nr , unsigned long const volatile *addr )
{ int oldbit ;
  unsigned long *__cil_tmp4 ;
  {
  __cil_tmp4 = (unsigned long *)addr;
  __asm__ volatile ("bt %2,%1\n\tsbb %0,%0": "=r" (oldbit): "m" (*__cil_tmp4),
                       "Ir" (nr));
  return (oldbit);
}
}
extern int printk(char const * , ...) ;
extern void might_fault(void) ;
extern void __bad_percpu_size(void) ;
extern struct task_struct *current_task ;
__inline static struct task_struct *get_current(void)
{ struct task_struct *pfo_ret__ ;
  {
  if (8 == 1) {
    goto case_1;
  } else
  if (8 == 2) {
    goto case_2;
  } else
  if (8 == 4) {
    goto case_4;
  } else
  if (8 == 8) {
    goto case_8;
  } else {
    {
    goto switch_default;
    if (0) {
      case_1:
      __asm__ ("movb %%gs:%P1,%0": "=q" (pfo_ret__): "p" (& current_task));
      goto ldv_2918;
      case_2:
      __asm__ ("movw %%gs:%P1,%0": "=r" (pfo_ret__): "p" (& current_task));
      goto ldv_2918;
      case_4:
      __asm__ ("movl %%gs:%P1,%0": "=r" (pfo_ret__): "p" (& current_task));
      goto ldv_2918;
      case_8:
      __asm__ ("movq %%gs:%P1,%0": "=r" (pfo_ret__): "p" (& current_task));
      goto ldv_2918;
      switch_default:
      {
      __bad_percpu_size();
      }
    } else {
      switch_break: ;
    }
    }
  }
  ldv_2918: ;
  return (pfo_ret__);
}
}
extern void *memcpy(void * , void const * , size_t ) ;
__inline static int test_ti_thread_flag(struct thread_info *ti , int flag )
{ int tmp ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  __u32 *__cil_tmp6 ;
  unsigned long const volatile *__cil_tmp7 ;
  {
  {
  __cil_tmp4 = (unsigned long )ti;
  __cil_tmp5 = __cil_tmp4 + 16;
  __cil_tmp6 = (__u32 *)__cil_tmp5;
  __cil_tmp7 = (unsigned long const volatile *)__cil_tmp6;
  tmp = variable_test_bit(flag, __cil_tmp7);
  }
  return (tmp);
}
}
extern void __init_waitqueue_head(wait_queue_head_t * , char const * , struct lock_class_key * ) ;
extern void __wake_up(wait_queue_head_t * , unsigned int , int , void * ) ;
extern void prepare_to_wait(wait_queue_head_t * , wait_queue_t * , int ) ;
extern void finish_wait(wait_queue_head_t * , wait_queue_t * ) ;
extern int autoremove_wake_function(wait_queue_t * , unsigned int , int , void * ) ;
extern void __mutex_init(struct mutex * , char const * , struct lock_class_key * ) ;
extern void mutex_lock_nested(struct mutex * , unsigned int ) ;
extern void mutex_unlock(struct mutex * ) ;
extern struct module __this_module ;
extern void kfree(void const * ) ;
extern void *kmem_cache_alloc(struct kmem_cache * , gfp_t ) ;
void *ldv_kmem_cache_alloc_16(struct kmem_cache *ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
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
__inline static void *ldv_kmalloc_12(size_t size , gfp_t flags )
{ void *tmp___2 ;
  {
  {
  tmp___2 = __kmalloc(size, flags);
  }
  return (tmp___2);
}
}
__inline static void *kmalloc(size_t size , gfp_t flags ) ;
__inline static void *kzalloc(size_t size , gfp_t flags ) ;
void ldv_check_alloc_flags(gfp_t flags ) ;
void ldv_check_alloc_nonatomic(void) ;
struct page *ldv_check_alloc_flags_and_return_some_page(gfp_t flags ) ;
extern long schedule_timeout(long ) ;
__inline static int test_tsk_thread_flag(struct task_struct *tsk , int flag )
{ int tmp ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  void *__cil_tmp6 ;
  struct thread_info *__cil_tmp7 ;
  {
  {
  __cil_tmp4 = (unsigned long )tsk;
  __cil_tmp5 = __cil_tmp4 + 8;
  __cil_tmp6 = *((void **)__cil_tmp5);
  __cil_tmp7 = (struct thread_info *)__cil_tmp6;
  tmp = test_ti_thread_flag(__cil_tmp7, flag);
  }
  return (tmp);
}
}
__inline static int signal_pending(struct task_struct *p )
{ int tmp ;
  long tmp___0 ;
  int __cil_tmp4 ;
  long __cil_tmp5 ;
  {
  {
  tmp = test_tsk_thread_flag(p, 2);
  __cil_tmp4 = tmp != 0;
  __cil_tmp5 = (long )__cil_tmp4;
  tmp___0 = __builtin_expect(__cil_tmp5, 0L);
  }
  return ((int )tmp___0);
}
}
extern loff_t noop_llseek(struct file * , loff_t , int ) ;
extern unsigned long _copy_to_user(void * , void const * , unsigned int ) ;
__inline static int copy_to_user(void *dst , void const *src , unsigned int size )
{ unsigned long tmp ;
  {
  {
  might_fault();
  tmp = _copy_to_user(dst, src, size);
  }
  return ((int )tmp);
}
}
extern void *dev_get_drvdata(struct device const * ) ;
extern int dev_set_drvdata(struct device * , void * ) ;
extern int dev_err(struct device const * , char const * , ...) ;
extern int dev_warn(struct device const * , char const * , ...) ;
extern int _dev_info(struct device const * , char const * , ...) ;
__inline static void *usb_get_intfdata(struct usb_interface *intf )
{ void *tmp ;
  unsigned long __cil_tmp3 ;
  unsigned long __cil_tmp4 ;
  struct device *__cil_tmp5 ;
  struct device const *__cil_tmp6 ;
  {
  {
  __cil_tmp3 = (unsigned long )intf;
  __cil_tmp4 = __cil_tmp3 + 48;
  __cil_tmp5 = (struct device *)__cil_tmp4;
  __cil_tmp6 = (struct device const *)__cil_tmp5;
  tmp = dev_get_drvdata(__cil_tmp6);
  }
  return (tmp);
}
}
__inline static void usb_set_intfdata(struct usb_interface *intf , void *data )
{ unsigned long __cil_tmp3 ;
  unsigned long __cil_tmp4 ;
  struct device *__cil_tmp5 ;
  {
  {
  __cil_tmp3 = (unsigned long )intf;
  __cil_tmp4 = __cil_tmp3 + 48;
  __cil_tmp5 = (struct device *)__cil_tmp4;
  dev_set_drvdata(__cil_tmp5, data);
  }
  return;
}
}
__inline static struct usb_device *interface_to_usbdev(struct usb_interface *intf )
{ struct device const *__mptr ;
  unsigned long __cil_tmp3 ;
  unsigned long __cil_tmp4 ;
  struct device *__cil_tmp5 ;
  struct usb_device *__cil_tmp6 ;
  {
  __cil_tmp3 = (unsigned long )intf;
  __cil_tmp4 = __cil_tmp3 + 48;
  __cil_tmp5 = *((struct device **)__cil_tmp4);
  __mptr = (struct device const *)__cil_tmp5;
  {
  __cil_tmp6 = (struct usb_device *)__mptr;
  return (__cil_tmp6 + 0xffffffffffffff78UL);
  }
}
}
extern int usb_register_driver(struct usb_driver * , struct module * , char const * ) ;
extern void usb_deregister(struct usb_driver * ) ;
extern int usb_register_dev(struct usb_interface * , struct usb_class_driver * ) ;
extern void usb_deregister_dev(struct usb_interface * , struct usb_class_driver * ) ;
__inline static void usb_fill_bulk_urb(struct urb *urb , struct usb_device *dev ,
                                       unsigned int pipe , void *transfer_buffer ,
                                       int buffer_length , void (*complete_fn)(struct urb * ) ,
                                       void *context )
{ unsigned long __cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  {
  __cil_tmp8 = (unsigned long )urb;
  __cil_tmp9 = __cil_tmp8 + 72;
  *((struct usb_device **)__cil_tmp9) = dev;
  __cil_tmp10 = (unsigned long )urb;
  __cil_tmp11 = __cil_tmp10 + 88;
  *((unsigned int *)__cil_tmp11) = pipe;
  __cil_tmp12 = (unsigned long )urb;
  __cil_tmp13 = __cil_tmp12 + 104;
  *((void **)__cil_tmp13) = transfer_buffer;
  __cil_tmp14 = (unsigned long )urb;
  __cil_tmp15 = __cil_tmp14 + 136;
  *((u32 *)__cil_tmp15) = (u32 )buffer_length;
  __cil_tmp16 = (unsigned long )urb;
  __cil_tmp17 = __cil_tmp16 + 184;
  *((void (**)(struct urb * ))__cil_tmp17) = complete_fn;
  __cil_tmp18 = (unsigned long )urb;
  __cil_tmp19 = __cil_tmp18 + 176;
  *((void **)__cil_tmp19) = context;
  return;
}
}
__inline static void usb_fill_int_urb(struct urb *urb , struct usb_device *dev , unsigned int pipe ,
                                      void *transfer_buffer , int buffer_length ,
                                      void (*complete_fn)(struct urb * ) , void *context ,
                                      int interval )
{ unsigned long __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  enum usb_device_speed __cil_tmp23 ;
  unsigned int __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  int __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  enum usb_device_speed __cil_tmp30 ;
  unsigned int __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  int __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  {
  __cil_tmp9 = (unsigned long )urb;
  __cil_tmp10 = __cil_tmp9 + 72;
  *((struct usb_device **)__cil_tmp10) = dev;
  __cil_tmp11 = (unsigned long )urb;
  __cil_tmp12 = __cil_tmp11 + 88;
  *((unsigned int *)__cil_tmp12) = pipe;
  __cil_tmp13 = (unsigned long )urb;
  __cil_tmp14 = __cil_tmp13 + 104;
  *((void **)__cil_tmp14) = transfer_buffer;
  __cil_tmp15 = (unsigned long )urb;
  __cil_tmp16 = __cil_tmp15 + 136;
  *((u32 *)__cil_tmp16) = (u32 )buffer_length;
  __cil_tmp17 = (unsigned long )urb;
  __cil_tmp18 = __cil_tmp17 + 184;
  *((void (**)(struct urb * ))__cil_tmp18) = complete_fn;
  __cil_tmp19 = (unsigned long )urb;
  __cil_tmp20 = __cil_tmp19 + 176;
  *((void **)__cil_tmp20) = context;
  {
  __cil_tmp21 = (unsigned long )dev;
  __cil_tmp22 = __cil_tmp21 + 28;
  __cil_tmp23 = *((enum usb_device_speed *)__cil_tmp22);
  __cil_tmp24 = (unsigned int )__cil_tmp23;
  if (__cil_tmp24 == 3U) {
    __cil_tmp25 = (unsigned long )urb;
    __cil_tmp26 = __cil_tmp25 + 168;
    __cil_tmp27 = interval + -1;
    *((int *)__cil_tmp26) = 1 << __cil_tmp27;
  } else {
    {
    __cil_tmp28 = (unsigned long )dev;
    __cil_tmp29 = __cil_tmp28 + 28;
    __cil_tmp30 = *((enum usb_device_speed *)__cil_tmp29);
    __cil_tmp31 = (unsigned int )__cil_tmp30;
    if (__cil_tmp31 == 5U) {
      __cil_tmp32 = (unsigned long )urb;
      __cil_tmp33 = __cil_tmp32 + 168;
      __cil_tmp34 = interval + -1;
      *((int *)__cil_tmp33) = 1 << __cil_tmp34;
    } else {
      __cil_tmp35 = (unsigned long )urb;
      __cil_tmp36 = __cil_tmp35 + 168;
      *((int *)__cil_tmp36) = interval;
    }
    }
  }
  }
  __cil_tmp37 = (unsigned long )urb;
  __cil_tmp38 = __cil_tmp37 + 160;
  *((int *)__cil_tmp38) = -1;
  return;
}
}
extern struct urb *usb_alloc_urb(int , gfp_t ) ;
struct urb *ldv_usb_alloc_urb_22(int ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
struct urb *ldv_usb_alloc_urb_23(int ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
struct urb *ldv_usb_alloc_urb_24(int ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
extern void usb_free_urb(struct urb * ) ;
extern int usb_submit_urb(struct urb * , gfp_t ) ;
int ldv_usb_submit_urb_19(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
int ldv_usb_submit_urb_20(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
int ldv_usb_submit_urb_21(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 ) ;
extern void usb_kill_urb(struct urb * ) ;
__inline static unsigned int __create_pipe(struct usb_device *dev , unsigned int endpoint )
{ unsigned int __cil_tmp3 ;
  int __cil_tmp4 ;
  int __cil_tmp5 ;
  unsigned int __cil_tmp6 ;
  {
  {
  __cil_tmp3 = endpoint << 15;
  __cil_tmp4 = *((int *)dev);
  __cil_tmp5 = __cil_tmp4 << 8;
  __cil_tmp6 = (unsigned int )__cil_tmp5;
  return (__cil_tmp6 | __cil_tmp3);
  }
}
}
static struct usb_endpoint_descriptor mdc800_ed[4U] = { {(__u8 )0U, (__u8 )0U, (__u8 )1U, (__u8 )2U, (__le16 )8U, (__u8 )0U, (__u8 )0U,
      (__u8 )0U},
        {(__u8 )0U, (__u8 )0U, (__u8 )130U, (__u8 )3U, (__le16 )8U, (__u8 )0U, (__u8 )0U,
      (__u8 )0U},
        {(__u8 )0U, (__u8 )0U, (__u8 )3U, (__u8 )2U, (__le16 )64U, (__u8 )0U, (__u8 )0U,
      (__u8 )0U},
        {(__u8 )0U, (__u8 )0U, (__u8 )132U, (__u8 )2U, (__le16 )64U, (__u8 )0U, (__u8 )0U,
      (__u8 )0U}};
static struct mdc800_data *mdc800 ;
static int mdc800_endpoint_equals(struct usb_endpoint_descriptor *a , struct usb_endpoint_descriptor *b )
{ int tmp ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  __u8 __cil_tmp6 ;
  int __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  __u8 __cil_tmp10 ;
  int __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  __u8 __cil_tmp14 ;
  int __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  __u8 __cil_tmp18 ;
  int __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  __le16 __cil_tmp22 ;
  int __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  __le16 __cil_tmp26 ;
  int __cil_tmp27 ;
  {
  {
  __cil_tmp4 = (unsigned long )b;
  __cil_tmp5 = __cil_tmp4 + 2;
  __cil_tmp6 = *((__u8 *)__cil_tmp5);
  __cil_tmp7 = (int )__cil_tmp6;
  __cil_tmp8 = (unsigned long )a;
  __cil_tmp9 = __cil_tmp8 + 2;
  __cil_tmp10 = *((__u8 *)__cil_tmp9);
  __cil_tmp11 = (int )__cil_tmp10;
  if (__cil_tmp11 == __cil_tmp7) {
    {
    __cil_tmp12 = (unsigned long )b;
    __cil_tmp13 = __cil_tmp12 + 3;
    __cil_tmp14 = *((__u8 *)__cil_tmp13);
    __cil_tmp15 = (int )__cil_tmp14;
    __cil_tmp16 = (unsigned long )a;
    __cil_tmp17 = __cil_tmp16 + 3;
    __cil_tmp18 = *((__u8 *)__cil_tmp17);
    __cil_tmp19 = (int )__cil_tmp18;
    if (__cil_tmp19 == __cil_tmp15) {
      {
      __cil_tmp20 = (unsigned long )b;
      __cil_tmp21 = __cil_tmp20 + 4;
      __cil_tmp22 = *((__le16 *)__cil_tmp21);
      __cil_tmp23 = (int )__cil_tmp22;
      __cil_tmp24 = (unsigned long )a;
      __cil_tmp25 = __cil_tmp24 + 4;
      __cil_tmp26 = *((__le16 *)__cil_tmp25);
      __cil_tmp27 = (int )__cil_tmp26;
      if (__cil_tmp27 == __cil_tmp23) {
        tmp = 1;
      } else {
        tmp = 0;
      }
      }
    } else {
      tmp = 0;
    }
    }
  } else {
    tmp = 0;
  }
  }
  return (tmp);
}
}
static int mdc800_isBusy(char *ch )
{ int i ;
  unsigned long __cil_tmp3 ;
  char *__cil_tmp4 ;
  char __cil_tmp5 ;
  signed char __cil_tmp6 ;
  int __cil_tmp7 ;
  {
  i = 0;
  goto ldv_24104;
  ldv_24103: ;
  {
  __cil_tmp3 = (unsigned long )i;
  __cil_tmp4 = ch + __cil_tmp3;
  __cil_tmp5 = *__cil_tmp4;
  __cil_tmp6 = (signed char )__cil_tmp5;
  __cil_tmp7 = (int )__cil_tmp6;
  if (__cil_tmp7 != -103) {
    return (0);
  } else {
  }
  }
  i = i + 1;
  ldv_24104: ;
  if (i <= 7) {
    goto ldv_24103;
  } else {
    goto ldv_24105;
  }
  ldv_24105: ;
  return (1);
}
}
static int mdc800_isReady(char *ch )
{ int i ;
  unsigned long __cil_tmp3 ;
  char *__cil_tmp4 ;
  char __cil_tmp5 ;
  signed char __cil_tmp6 ;
  int __cil_tmp7 ;
  {
  i = 0;
  goto ldv_24111;
  ldv_24110: ;
  {
  __cil_tmp3 = (unsigned long )i;
  __cil_tmp4 = ch + __cil_tmp3;
  __cil_tmp5 = *__cil_tmp4;
  __cil_tmp6 = (signed char )__cil_tmp5;
  __cil_tmp7 = (int )__cil_tmp6;
  if (__cil_tmp7 != -69) {
    return (0);
  } else {
  }
  }
  i = i + 1;
  ldv_24111: ;
  if (i <= 7) {
    goto ldv_24110;
  } else {
    goto ldv_24112;
  }
  ldv_24112: ;
  return (1);
}
}
static void mdc800_usb_irq(struct urb *urb )
{ int data_received ;
  int wake_up ;
  unsigned char *b ;
  struct mdc800_data *mdc800___0 ;
  int status ;
  int tmp ;
  int tmp___0 ;
  size_t __len ;
  void *__ret ;
  int tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  void *__cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  void *__cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  char *__cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  int __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  int __cil_tmp30 ;
  char *__cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  char *__cil_tmp34 ;
  char *__cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  char (*__cil_tmp38)[8U] ;
  void *__cil_tmp39 ;
  void const *__cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  char (*__cil_tmp43)[8U] ;
  void *__cil_tmp44 ;
  void const *__cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  int __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  int __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  int __cil_tmp54 ;
  unsigned long __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  int __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  int __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  int __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  wait_queue_head_t *__cil_tmp70 ;
  void *__cil_tmp71 ;
  {
  data_received = 0;
  __cil_tmp14 = (unsigned long )urb;
  __cil_tmp15 = __cil_tmp14 + 104;
  __cil_tmp16 = *((void **)__cil_tmp15);
  b = (unsigned char *)__cil_tmp16;
  __cil_tmp17 = (unsigned long )urb;
  __cil_tmp18 = __cil_tmp17 + 176;
  __cil_tmp19 = *((void **)__cil_tmp18);
  mdc800___0 = (struct mdc800_data *)__cil_tmp19;
  __cil_tmp20 = (unsigned long )urb;
  __cil_tmp21 = __cil_tmp20 + 96;
  status = *((int *)__cil_tmp21);
  if (status >= 0) {
    {
    __cil_tmp22 = (char *)b;
    tmp___0 = mdc800_isBusy(__cil_tmp22);
    }
    if (tmp___0 != 0) {
      {
      __cil_tmp23 = (unsigned long )mdc800___0;
      __cil_tmp24 = __cil_tmp23 + 144;
      __cil_tmp25 = *((int *)__cil_tmp24);
      if (__cil_tmp25 == 0) {
        __cil_tmp26 = (unsigned long )mdc800___0;
        __cil_tmp27 = __cil_tmp26 + 144;
        *((int *)__cil_tmp27) = 1;
      } else {
        {
        __cil_tmp28 = (unsigned long )mdc800___0;
        __cil_tmp29 = __cil_tmp28 + 144;
        __cil_tmp30 = *((int *)__cil_tmp29);
        if (__cil_tmp30 != 0) {
          {
          __cil_tmp31 = (char *)b;
          tmp = mdc800_isReady(__cil_tmp31);
          }
          if (tmp != 0) {
            __cil_tmp32 = (unsigned long )mdc800___0;
            __cil_tmp33 = __cil_tmp32 + 144;
            *((int *)__cil_tmp33) = 0;
          } else {
          }
        } else {
        }
        }
      }
      }
    } else {
    }
    {
    __cil_tmp34 = (char *)b;
    tmp___1 = mdc800_isBusy(__cil_tmp34);
    }
    if (tmp___1 == 0) {
      {
      __cil_tmp35 = (char *)b;
      tmp___2 = mdc800_isReady(__cil_tmp35);
      }
      if (tmp___2 == 0) {
        __len = 8UL;
        if (__len > 63UL) {
          {
          __cil_tmp36 = (unsigned long )mdc800___0;
          __cil_tmp37 = __cil_tmp36 + 152;
          __cil_tmp38 = (char (*)[8U])__cil_tmp37;
          __cil_tmp39 = (void *)__cil_tmp38;
          __cil_tmp40 = (void const *)b;
          __ret = memcpy(__cil_tmp39, __cil_tmp40, __len);
          }
        } else {
          {
          __cil_tmp41 = (unsigned long )mdc800___0;
          __cil_tmp42 = __cil_tmp41 + 152;
          __cil_tmp43 = (char (*)[8U])__cil_tmp42;
          __cil_tmp44 = (void *)__cil_tmp43;
          __cil_tmp45 = (void const *)b;
          __ret = memcpy(__cil_tmp44, __cil_tmp45, __len);
          }
        }
        data_received = 1;
      } else {
      }
    } else {
    }
  } else {
  }
  {
  __cil_tmp46 = (unsigned long )mdc800___0;
  __cil_tmp47 = __cil_tmp46 + 148;
  __cil_tmp48 = *((int *)__cil_tmp47);
  if (__cil_tmp48 > 0) {
    {
    __cil_tmp49 = (unsigned long )mdc800___0;
    __cil_tmp50 = __cil_tmp49 + 148;
    __cil_tmp51 = *((int *)__cil_tmp50);
    if (__cil_tmp51 == 1) {
      {
      __cil_tmp52 = (unsigned long )mdc800___0;
      __cil_tmp53 = __cil_tmp52 + 144;
      __cil_tmp54 = *((int *)__cil_tmp53);
      if (__cil_tmp54 == 0) {
        tmp___3 = 1;
      } else {
        goto _L___1;
      }
      }
    } else {
      _L___1:
      {
      __cil_tmp55 = (unsigned long )mdc800___0;
      __cil_tmp56 = __cil_tmp55 + 148;
      __cil_tmp57 = *((int *)__cil_tmp56);
      if (__cil_tmp57 == 2) {
        if (data_received != 0) {
          tmp___3 = 1;
        } else {
          goto _L___0;
        }
      } else {
        _L___0:
        {
        __cil_tmp58 = (unsigned long )mdc800___0;
        __cil_tmp59 = __cil_tmp58 + 148;
        __cil_tmp60 = *((int *)__cil_tmp59);
        if (__cil_tmp60 == 3) {
          {
          __cil_tmp61 = (unsigned long )mdc800___0;
          __cil_tmp62 = __cil_tmp61 + 144;
          __cil_tmp63 = *((int *)__cil_tmp62);
          if (__cil_tmp63 != 0) {
            tmp___3 = 1;
          } else {
            goto _L;
          }
          }
        } else
        _L:
        if (status < 0) {
          tmp___3 = 1;
        } else {
          tmp___3 = 0;
        }
        }
      }
      }
    }
    }
  } else {
    tmp___3 = 0;
  }
  }
  wake_up = tmp___3;
  if (wake_up != 0) {
    {
    __cil_tmp64 = (unsigned long )mdc800___0;
    __cil_tmp65 = __cil_tmp64 + 148;
    *((int *)__cil_tmp65) = 0;
    __cil_tmp66 = (unsigned long )mdc800___0;
    __cil_tmp67 = __cil_tmp66 + 128;
    *((int *)__cil_tmp67) = 1;
    __cil_tmp68 = (unsigned long )mdc800___0;
    __cil_tmp69 = __cil_tmp68 + 40;
    __cil_tmp70 = (wait_queue_head_t *)__cil_tmp69;
    __cil_tmp71 = (void *)0;
    __wake_up(__cil_tmp70, 3U, 1, __cil_tmp71);
    }
  } else {
  }
  return;
}
}
static int mdc800_usb_waitForIRQ(int mode , int msec )
{ long __ret ;
  wait_queue_t __wait ;
  struct task_struct *tmp ;
  unsigned long __cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  int __cil_tmp8 ;
  int __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  int __cil_tmp12 ;
  wait_queue_t *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  wait_queue_head_t *__cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  int __cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  wait_queue_head_t *__cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  int __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  struct usb_device *__cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  struct device *__cil_tmp40 ;
  struct device const *__cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  mdc800_state __cil_tmp44 ;
  unsigned int __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  {
  __cil_tmp6 = (unsigned long )mdc800;
  __cil_tmp7 = __cil_tmp6 + 148;
  *((int *)__cil_tmp7) = mode + 1;
  __cil_tmp8 = msec * 250;
  __cil_tmp9 = __cil_tmp8 / 1000;
  __ret = (long )__cil_tmp9;
  {
  __cil_tmp10 = (unsigned long )mdc800;
  __cil_tmp11 = __cil_tmp10 + 128;
  __cil_tmp12 = *((int *)__cil_tmp11);
  if (__cil_tmp12 == 0) {
    {
    tmp = get_current();
    __cil_tmp13 = & __wait;
    *((unsigned int *)__cil_tmp13) = 0U;
    __cil_tmp14 = (unsigned long )(& __wait) + 8;
    *((void **)__cil_tmp14) = (void *)tmp;
    __cil_tmp15 = (unsigned long )(& __wait) + 16;
    *((int (**)(wait_queue_t * , unsigned int , int , void * ))__cil_tmp15) = & autoremove_wake_function;
    __cil_tmp16 = (unsigned long )(& __wait) + 24;
    __cil_tmp17 = (unsigned long )(& __wait) + 24;
    *((struct list_head **)__cil_tmp16) = (struct list_head *)__cil_tmp17;
    __cil_tmp18 = 24 + 8;
    __cil_tmp19 = (unsigned long )(& __wait) + __cil_tmp18;
    __cil_tmp20 = (unsigned long )(& __wait) + 24;
    *((struct list_head **)__cil_tmp19) = (struct list_head *)__cil_tmp20;
    }
    ldv_24131:
    {
    __cil_tmp21 = (unsigned long )mdc800;
    __cil_tmp22 = __cil_tmp21 + 40;
    __cil_tmp23 = (wait_queue_head_t *)__cil_tmp22;
    prepare_to_wait(__cil_tmp23, & __wait, 2);
    }
    {
    __cil_tmp24 = (unsigned long )mdc800;
    __cil_tmp25 = __cil_tmp24 + 128;
    __cil_tmp26 = *((int *)__cil_tmp25);
    if (__cil_tmp26 != 0) {
      goto ldv_24130;
    } else {
    }
    }
    {
    __ret = schedule_timeout(__ret);
    }
    if (__ret == 0L) {
      goto ldv_24130;
    } else {
    }
    goto ldv_24131;
    ldv_24130:
    {
    __cil_tmp27 = (unsigned long )mdc800;
    __cil_tmp28 = __cil_tmp27 + 40;
    __cil_tmp29 = (wait_queue_head_t *)__cil_tmp28;
    finish_wait(__cil_tmp29, & __wait);
    }
  } else {
  }
  }
  __cil_tmp30 = (unsigned long )mdc800;
  __cil_tmp31 = __cil_tmp30 + 128;
  *((int *)__cil_tmp31) = 0;
  {
  __cil_tmp32 = (unsigned long )mdc800;
  __cil_tmp33 = __cil_tmp32 + 148;
  __cil_tmp34 = *((int *)__cil_tmp33);
  if (__cil_tmp34 > 0) {
    {
    __cil_tmp35 = (unsigned long )mdc800;
    __cil_tmp36 = __cil_tmp35 + 148;
    *((int *)__cil_tmp36) = 0;
    __cil_tmp37 = *((struct usb_device **)mdc800);
    __cil_tmp38 = (unsigned long )__cil_tmp37;
    __cil_tmp39 = __cil_tmp38 + 136;
    __cil_tmp40 = (struct device *)__cil_tmp39;
    __cil_tmp41 = (struct device const *)__cil_tmp40;
    dev_err(__cil_tmp41, "timeout waiting for camera.\n");
    }
    return (-1);
  } else {
  }
  }
  {
  __cil_tmp42 = (unsigned long )mdc800;
  __cil_tmp43 = __cil_tmp42 + 8;
  __cil_tmp44 = *((mdc800_state *)__cil_tmp43);
  __cil_tmp45 = (unsigned int )__cil_tmp44;
  if (__cil_tmp45 == 0U) {
    {
    printk("<4>mdc800: Camera gets disconnected during waiting for irq.\n");
    __cil_tmp46 = (unsigned long )mdc800;
    __cil_tmp47 = __cil_tmp46 + 148;
    *((int *)__cil_tmp47) = 0;
    }
    return (-2);
  } else {
  }
  }
  return (0);
}
}
static void mdc800_usb_write_notify(struct urb *urb )
{ struct mdc800_data *mdc800___0 ;
  int status ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  void *__cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  struct usb_device *__cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  struct device *__cil_tmp12 ;
  struct device const *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  wait_queue_head_t *__cil_tmp20 ;
  void *__cil_tmp21 ;
  {
  __cil_tmp4 = (unsigned long )urb;
  __cil_tmp5 = __cil_tmp4 + 176;
  __cil_tmp6 = *((void **)__cil_tmp5);
  mdc800___0 = (struct mdc800_data *)__cil_tmp6;
  __cil_tmp7 = (unsigned long )urb;
  __cil_tmp8 = __cil_tmp7 + 96;
  status = *((int *)__cil_tmp8);
  if (status != 0) {
    {
    __cil_tmp9 = *((struct usb_device **)mdc800___0);
    __cil_tmp10 = (unsigned long )__cil_tmp9;
    __cil_tmp11 = __cil_tmp10 + 136;
    __cil_tmp12 = (struct device *)__cil_tmp11;
    __cil_tmp13 = (struct device const *)__cil_tmp12;
    dev_err(__cil_tmp13, "writing command fails (status=%i)\n", status);
    }
  } else {
    __cil_tmp14 = (unsigned long )mdc800___0;
    __cil_tmp15 = __cil_tmp14 + 8;
    *((mdc800_state *)__cil_tmp15) = (mdc800_state )1;
  }
  {
  __cil_tmp16 = (unsigned long )mdc800___0;
  __cil_tmp17 = __cil_tmp16 + 264;
  *((int *)__cil_tmp17) = 1;
  __cil_tmp18 = (unsigned long )mdc800___0;
  __cil_tmp19 = __cil_tmp18 + 176;
  __cil_tmp20 = (wait_queue_head_t *)__cil_tmp19;
  __cil_tmp21 = (void *)0;
  __wake_up(__cil_tmp20, 3U, 1, __cil_tmp21);
  }
  return;
}
}
static void mdc800_usb_download_notify(struct urb *urb )
{ struct mdc800_data *mdc800___0 ;
  int status ;
  size_t __len ;
  void *__ret ;
  unsigned long __cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  void *__cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  char (*__cil_tmp13)[64U] ;
  void *__cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  void *__cil_tmp17 ;
  void const *__cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  char (*__cil_tmp21)[64U] ;
  void *__cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  void *__cil_tmp25 ;
  void const *__cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  int __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  int __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  struct usb_device *__cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  struct device *__cil_tmp44 ;
  struct device const *__cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  wait_queue_head_t *__cil_tmp50 ;
  void *__cil_tmp51 ;
  {
  __cil_tmp6 = (unsigned long )urb;
  __cil_tmp7 = __cil_tmp6 + 176;
  __cil_tmp8 = *((void **)__cil_tmp7);
  mdc800___0 = (struct mdc800_data *)__cil_tmp8;
  __cil_tmp9 = (unsigned long )urb;
  __cil_tmp10 = __cil_tmp9 + 96;
  status = *((int *)__cil_tmp10);
  if (status == 0) {
    __len = 64UL;
    if (__len > 63UL) {
      {
      __cil_tmp11 = (unsigned long )mdc800___0;
      __cil_tmp12 = __cil_tmp11 + 384;
      __cil_tmp13 = (char (*)[64U])__cil_tmp12;
      __cil_tmp14 = (void *)__cil_tmp13;
      __cil_tmp15 = (unsigned long )urb;
      __cil_tmp16 = __cil_tmp15 + 104;
      __cil_tmp17 = *((void **)__cil_tmp16);
      __cil_tmp18 = (void const *)__cil_tmp17;
      __ret = memcpy(__cil_tmp14, __cil_tmp18, __len);
      }
    } else {
      {
      __cil_tmp19 = (unsigned long )mdc800___0;
      __cil_tmp20 = __cil_tmp19 + 384;
      __cil_tmp21 = (char (*)[64U])__cil_tmp20;
      __cil_tmp22 = (void *)__cil_tmp21;
      __cil_tmp23 = (unsigned long )urb;
      __cil_tmp24 = __cil_tmp23 + 104;
      __cil_tmp25 = *((void **)__cil_tmp24);
      __cil_tmp26 = (void const *)__cil_tmp25;
      __ret = memcpy(__cil_tmp22, __cil_tmp26, __len);
      }
    }
    __cil_tmp27 = (unsigned long )mdc800___0;
    __cil_tmp28 = __cil_tmp27 + 452;
    *((int *)__cil_tmp28) = 64;
    __cil_tmp29 = (unsigned long )mdc800___0;
    __cil_tmp30 = __cil_tmp29 + 448;
    *((int *)__cil_tmp30) = 0;
    __cil_tmp31 = (unsigned long )mdc800___0;
    __cil_tmp32 = __cil_tmp31 + 380;
    __cil_tmp33 = (unsigned long )mdc800___0;
    __cil_tmp34 = __cil_tmp33 + 380;
    __cil_tmp35 = *((int *)__cil_tmp34);
    *((int *)__cil_tmp32) = __cil_tmp35 + -64;
    {
    __cil_tmp36 = (unsigned long )mdc800___0;
    __cil_tmp37 = __cil_tmp36 + 380;
    __cil_tmp38 = *((int *)__cil_tmp37);
    if (__cil_tmp38 == 0) {
      __cil_tmp39 = (unsigned long )mdc800___0;
      __cil_tmp40 = __cil_tmp39 + 8;
      *((mdc800_state *)__cil_tmp40) = (mdc800_state )1;
    } else {
    }
    }
  } else {
    {
    __cil_tmp41 = *((struct usb_device **)mdc800___0);
    __cil_tmp42 = (unsigned long )__cil_tmp41;
    __cil_tmp43 = __cil_tmp42 + 136;
    __cil_tmp44 = (struct device *)__cil_tmp43;
    __cil_tmp45 = (struct device const *)__cil_tmp44;
    dev_err(__cil_tmp45, "request bytes fails (status:%i)\n", status);
    }
  }
  {
  __cil_tmp46 = (unsigned long )mdc800___0;
  __cil_tmp47 = __cil_tmp46 + 376;
  *((int *)__cil_tmp47) = 1;
  __cil_tmp48 = (unsigned long )mdc800___0;
  __cil_tmp49 = __cil_tmp48 + 288;
  __cil_tmp50 = (wait_queue_head_t *)__cil_tmp49;
  __cil_tmp51 = (void *)0;
  __wake_up(__cil_tmp50, 3U, 1, __cil_tmp51);
  }
  return;
}
}
static struct usb_driver mdc800_usb_driver ;
static struct file_operations const mdc800_device_ops ;
static struct usb_class_driver mdc800_class = {(char *)"mdc800%d", (char *(*)(struct device * , umode_t * ))0, & mdc800_device_ops,
    32};
static int mdc800_usb_probe(struct usb_interface *intf , struct usb_device_id const *id )
{ int i ;
  int j ;
  struct usb_host_interface *intf_desc ;
  struct usb_device *dev ;
  struct usb_device *tmp ;
  int irq_interval ;
  int retval ;
  int tmp___0 ;
  unsigned int tmp___1 ;
  unsigned int tmp___2 ;
  unsigned int tmp___3 ;
  struct usb_device *__cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  struct usb_device *__cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  struct device *__cil_tmp20 ;
  struct device const *__cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  __u8 __cil_tmp25 ;
  unsigned int __cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  struct device *__cil_tmp29 ;
  struct device const *__cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  __u8 __cil_tmp36 ;
  unsigned int __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  struct device *__cil_tmp40 ;
  struct device const *__cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  unsigned long __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  __u8 __cil_tmp45 ;
  unsigned int __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  struct device *__cil_tmp49 ;
  struct device const *__cil_tmp50 ;
  unsigned long __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  __u8 __cil_tmp54 ;
  unsigned int __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  struct device *__cil_tmp58 ;
  struct device const *__cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  __u8 __cil_tmp63 ;
  unsigned int __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  struct device *__cil_tmp67 ;
  struct device const *__cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  unsigned long __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  unsigned long __cil_tmp75 ;
  struct usb_host_endpoint *__cil_tmp76 ;
  struct usb_host_endpoint *__cil_tmp77 ;
  struct usb_endpoint_descriptor *__cil_tmp78 ;
  unsigned long __cil_tmp79 ;
  struct usb_endpoint_descriptor *__cil_tmp80 ;
  struct usb_endpoint_descriptor *__cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  unsigned long __cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  unsigned long __cil_tmp89 ;
  struct usb_host_endpoint *__cil_tmp90 ;
  struct usb_host_endpoint *__cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  __u8 __cil_tmp94 ;
  unsigned long __cil_tmp95 ;
  unsigned long __cil_tmp96 ;
  unsigned long __cil_tmp97 ;
  unsigned long __cil_tmp98 ;
  struct usb_host_endpoint *__cil_tmp99 ;
  struct usb_host_endpoint *__cil_tmp100 ;
  unsigned long __cil_tmp101 ;
  unsigned long __cil_tmp102 ;
  __u8 __cil_tmp103 ;
  unsigned long __cil_tmp104 ;
  unsigned long __cil_tmp105 ;
  unsigned long __cil_tmp106 ;
  unsigned long __cil_tmp107 ;
  unsigned int __cil_tmp108 ;
  unsigned long __cil_tmp109 ;
  unsigned long __cil_tmp110 ;
  struct device *__cil_tmp111 ;
  struct device const *__cil_tmp112 ;
  unsigned long __cil_tmp113 ;
  unsigned long __cil_tmp114 ;
  struct device *__cil_tmp115 ;
  struct device const *__cil_tmp116 ;
  unsigned long __cil_tmp117 ;
  unsigned long __cil_tmp118 ;
  struct mutex *__cil_tmp119 ;
  unsigned long __cil_tmp120 ;
  unsigned long __cil_tmp121 ;
  struct device *__cil_tmp122 ;
  struct device const *__cil_tmp123 ;
  unsigned long __cil_tmp124 ;
  unsigned long __cil_tmp125 ;
  struct mutex *__cil_tmp126 ;
  unsigned long __cil_tmp127 ;
  unsigned long __cil_tmp128 ;
  struct usb_device *__cil_tmp129 ;
  unsigned long __cil_tmp130 ;
  unsigned long __cil_tmp131 ;
  unsigned long __cil_tmp132 ;
  unsigned long __cil_tmp133 ;
  unsigned int __cil_tmp134 ;
  unsigned long __cil_tmp135 ;
  unsigned long __cil_tmp136 ;
  struct urb *__cil_tmp137 ;
  struct usb_device *__cil_tmp138 ;
  unsigned int __cil_tmp139 ;
  unsigned long __cil_tmp140 ;
  unsigned long __cil_tmp141 ;
  char *__cil_tmp142 ;
  void *__cil_tmp143 ;
  void *__cil_tmp144 ;
  struct usb_device *__cil_tmp145 ;
  unsigned long __cil_tmp146 ;
  unsigned long __cil_tmp147 ;
  unsigned long __cil_tmp148 ;
  unsigned long __cil_tmp149 ;
  unsigned int __cil_tmp150 ;
  unsigned long __cil_tmp151 ;
  unsigned long __cil_tmp152 ;
  struct urb *__cil_tmp153 ;
  struct usb_device *__cil_tmp154 ;
  unsigned int __cil_tmp155 ;
  unsigned long __cil_tmp156 ;
  unsigned long __cil_tmp157 ;
  char *__cil_tmp158 ;
  void *__cil_tmp159 ;
  void *__cil_tmp160 ;
  struct usb_device *__cil_tmp161 ;
  unsigned long __cil_tmp162 ;
  unsigned long __cil_tmp163 ;
  unsigned long __cil_tmp164 ;
  unsigned long __cil_tmp165 ;
  unsigned int __cil_tmp166 ;
  unsigned long __cil_tmp167 ;
  unsigned long __cil_tmp168 ;
  struct urb *__cil_tmp169 ;
  struct usb_device *__cil_tmp170 ;
  unsigned int __cil_tmp171 ;
  unsigned long __cil_tmp172 ;
  unsigned long __cil_tmp173 ;
  char *__cil_tmp174 ;
  void *__cil_tmp175 ;
  void *__cil_tmp176 ;
  unsigned long __cil_tmp177 ;
  unsigned long __cil_tmp178 ;
  unsigned long __cil_tmp179 ;
  unsigned long __cil_tmp180 ;
  struct mutex *__cil_tmp181 ;
  void *__cil_tmp182 ;
  {
  {
  tmp = interface_to_usbdev(intf);
  dev = tmp;
  irq_interval = 0;
  }
  {
  __cil_tmp14 = (struct usb_device *)0;
  __cil_tmp15 = (unsigned long )__cil_tmp14;
  __cil_tmp16 = *((struct usb_device **)mdc800);
  __cil_tmp17 = (unsigned long )__cil_tmp16;
  if (__cil_tmp17 != __cil_tmp15) {
    {
    __cil_tmp18 = (unsigned long )intf;
    __cil_tmp19 = __cil_tmp18 + 48;
    __cil_tmp20 = (struct device *)__cil_tmp19;
    __cil_tmp21 = (struct device const *)__cil_tmp20;
    dev_warn(__cil_tmp21, "only one Mustek MDC800 is supported.\n");
    }
    return (-19);
  } else {
  }
  }
  {
  __cil_tmp22 = 1288 + 17;
  __cil_tmp23 = (unsigned long )dev;
  __cil_tmp24 = __cil_tmp23 + __cil_tmp22;
  __cil_tmp25 = *((__u8 *)__cil_tmp24);
  __cil_tmp26 = (unsigned int )__cil_tmp25;
  if (__cil_tmp26 != 1U) {
    {
    __cil_tmp27 = (unsigned long )intf;
    __cil_tmp28 = __cil_tmp27 + 48;
    __cil_tmp29 = (struct device *)__cil_tmp28;
    __cil_tmp30 = (struct device const *)__cil_tmp29;
    dev_err(__cil_tmp30, "probe fails -> wrong Number of Configuration\n");
    }
    return (-19);
  } else {
  }
  }
  __cil_tmp31 = (unsigned long )intf;
  __cil_tmp32 = __cil_tmp31 + 8;
  intf_desc = *((struct usb_host_interface **)__cil_tmp32);
  {
  __cil_tmp33 = 0 + 5;
  __cil_tmp34 = (unsigned long )intf_desc;
  __cil_tmp35 = __cil_tmp34 + __cil_tmp33;
  __cil_tmp36 = *((__u8 *)__cil_tmp35);
  __cil_tmp37 = (unsigned int )__cil_tmp36;
  if (__cil_tmp37 != 255U) {
    {
    __cil_tmp38 = (unsigned long )intf;
    __cil_tmp39 = __cil_tmp38 + 48;
    __cil_tmp40 = (struct device *)__cil_tmp39;
    __cil_tmp41 = (struct device const *)__cil_tmp40;
    dev_err(__cil_tmp41, "probe fails -> wrong Interface\n");
    }
    return (-19);
  } else {
    {
    __cil_tmp42 = 0 + 6;
    __cil_tmp43 = (unsigned long )intf_desc;
    __cil_tmp44 = __cil_tmp43 + __cil_tmp42;
    __cil_tmp45 = *((__u8 *)__cil_tmp44);
    __cil_tmp46 = (unsigned int )__cil_tmp45;
    if (__cil_tmp46 != 0U) {
      {
      __cil_tmp47 = (unsigned long )intf;
      __cil_tmp48 = __cil_tmp47 + 48;
      __cil_tmp49 = (struct device *)__cil_tmp48;
      __cil_tmp50 = (struct device const *)__cil_tmp49;
      dev_err(__cil_tmp50, "probe fails -> wrong Interface\n");
      }
      return (-19);
    } else {
      {
      __cil_tmp51 = 0 + 7;
      __cil_tmp52 = (unsigned long )intf_desc;
      __cil_tmp53 = __cil_tmp52 + __cil_tmp51;
      __cil_tmp54 = *((__u8 *)__cil_tmp53);
      __cil_tmp55 = (unsigned int )__cil_tmp54;
      if (__cil_tmp55 != 0U) {
        {
        __cil_tmp56 = (unsigned long )intf;
        __cil_tmp57 = __cil_tmp56 + 48;
        __cil_tmp58 = (struct device *)__cil_tmp57;
        __cil_tmp59 = (struct device const *)__cil_tmp58;
        dev_err(__cil_tmp59, "probe fails -> wrong Interface\n");
        }
        return (-19);
      } else {
        {
        __cil_tmp60 = 0 + 4;
        __cil_tmp61 = (unsigned long )intf_desc;
        __cil_tmp62 = __cil_tmp61 + __cil_tmp60;
        __cil_tmp63 = *((__u8 *)__cil_tmp62);
        __cil_tmp64 = (unsigned int )__cil_tmp63;
        if (__cil_tmp64 != 4U) {
          {
          __cil_tmp65 = (unsigned long )intf;
          __cil_tmp66 = __cil_tmp65 + 48;
          __cil_tmp67 = (struct device *)__cil_tmp66;
          __cil_tmp68 = (struct device const *)__cil_tmp67;
          dev_err(__cil_tmp68, "probe fails -> wrong Interface\n");
          }
          return (-19);
        } else {
        }
        }
      }
      }
    }
    }
  }
  }
  i = 0;
  goto ldv_24163;
  ldv_24162:
  __cil_tmp69 = i * 4UL;
  __cil_tmp70 = 12 + __cil_tmp69;
  __cil_tmp71 = (unsigned long )mdc800;
  __cil_tmp72 = __cil_tmp71 + __cil_tmp70;
  *((unsigned int *)__cil_tmp72) = 4294967295U;
  j = 0;
  goto ldv_24160;
  ldv_24159:
  {
  __cil_tmp73 = (unsigned long )j;
  __cil_tmp74 = (unsigned long )intf_desc;
  __cil_tmp75 = __cil_tmp74 + 16;
  __cil_tmp76 = *((struct usb_host_endpoint **)__cil_tmp75);
  __cil_tmp77 = __cil_tmp76 + __cil_tmp73;
  __cil_tmp78 = (struct usb_endpoint_descriptor *)__cil_tmp77;
  __cil_tmp79 = (unsigned long )i;
  __cil_tmp80 = (struct usb_endpoint_descriptor *)(& mdc800_ed);
  __cil_tmp81 = __cil_tmp80 + __cil_tmp79;
  tmp___0 = mdc800_endpoint_equals(__cil_tmp78, __cil_tmp81);
  }
  if (tmp___0 != 0) {
    __cil_tmp82 = i * 4UL;
    __cil_tmp83 = 12 + __cil_tmp82;
    __cil_tmp84 = (unsigned long )mdc800;
    __cil_tmp85 = __cil_tmp84 + __cil_tmp83;
    __cil_tmp86 = 0 + 2;
    __cil_tmp87 = (unsigned long )j;
    __cil_tmp88 = (unsigned long )intf_desc;
    __cil_tmp89 = __cil_tmp88 + 16;
    __cil_tmp90 = *((struct usb_host_endpoint **)__cil_tmp89);
    __cil_tmp91 = __cil_tmp90 + __cil_tmp87;
    __cil_tmp92 = (unsigned long )__cil_tmp91;
    __cil_tmp93 = __cil_tmp92 + __cil_tmp86;
    __cil_tmp94 = *((__u8 *)__cil_tmp93);
    *((unsigned int *)__cil_tmp85) = (unsigned int )__cil_tmp94;
    if (i == 1) {
      __cil_tmp95 = 0 + 6;
      __cil_tmp96 = (unsigned long )j;
      __cil_tmp97 = (unsigned long )intf_desc;
      __cil_tmp98 = __cil_tmp97 + 16;
      __cil_tmp99 = *((struct usb_host_endpoint **)__cil_tmp98);
      __cil_tmp100 = __cil_tmp99 + __cil_tmp96;
      __cil_tmp101 = (unsigned long )__cil_tmp100;
      __cil_tmp102 = __cil_tmp101 + __cil_tmp95;
      __cil_tmp103 = *((__u8 *)__cil_tmp102);
      irq_interval = (int )__cil_tmp103;
    } else {
    }
  } else {
  }
  j = j + 1;
  ldv_24160: ;
  if (j <= 3) {
    goto ldv_24159;
  } else {
    goto ldv_24161;
  }
  ldv_24161: ;
  {
  __cil_tmp104 = i * 4UL;
  __cil_tmp105 = 12 + __cil_tmp104;
  __cil_tmp106 = (unsigned long )mdc800;
  __cil_tmp107 = __cil_tmp106 + __cil_tmp105;
  __cil_tmp108 = *((unsigned int *)__cil_tmp107);
  if (__cil_tmp108 == 4294967295U) {
    {
    __cil_tmp109 = (unsigned long )intf;
    __cil_tmp110 = __cil_tmp109 + 48;
    __cil_tmp111 = (struct device *)__cil_tmp110;
    __cil_tmp112 = (struct device const *)__cil_tmp111;
    dev_err(__cil_tmp112, "probe fails -> Wrong Endpoints.\n");
    }
    return (-19);
  } else {
  }
  }
  i = i + 1;
  ldv_24163: ;
  if (i <= 3) {
    goto ldv_24162;
  } else {
    goto ldv_24164;
  }
  ldv_24164:
  {
  __cil_tmp113 = (unsigned long )intf;
  __cil_tmp114 = __cil_tmp113 + 48;
  __cil_tmp115 = (struct device *)__cil_tmp114;
  __cil_tmp116 = (struct device const *)__cil_tmp115;
  _dev_info(__cil_tmp116, "Found Mustek MDC800 on USB.\n");
  __cil_tmp117 = (unsigned long )mdc800;
  __cil_tmp118 = __cil_tmp117 + 464;
  __cil_tmp119 = (struct mutex *)__cil_tmp118;
  mutex_lock_nested(__cil_tmp119, 0U);
  retval = usb_register_dev(intf, & mdc800_class);
  }
  if (retval != 0) {
    {
    __cil_tmp120 = (unsigned long )intf;
    __cil_tmp121 = __cil_tmp120 + 48;
    __cil_tmp122 = (struct device *)__cil_tmp121;
    __cil_tmp123 = (struct device const *)__cil_tmp122;
    dev_err(__cil_tmp123, "Not able to get a minor for this device.\n");
    __cil_tmp124 = (unsigned long )mdc800;
    __cil_tmp125 = __cil_tmp124 + 464;
    __cil_tmp126 = (struct mutex *)__cil_tmp125;
    mutex_unlock(__cil_tmp126);
    }
    return (-19);
  } else {
  }
  {
  *((struct usb_device **)mdc800) = dev;
  __cil_tmp127 = (unsigned long )mdc800;
  __cil_tmp128 = __cil_tmp127 + 456;
  *((int *)__cil_tmp128) = 0;
  __cil_tmp129 = *((struct usb_device **)mdc800);
  __cil_tmp130 = 1 * 4UL;
  __cil_tmp131 = 12 + __cil_tmp130;
  __cil_tmp132 = (unsigned long )mdc800;
  __cil_tmp133 = __cil_tmp132 + __cil_tmp131;
  __cil_tmp134 = *((unsigned int *)__cil_tmp133);
  tmp___1 = __create_pipe(__cil_tmp129, __cil_tmp134);
  __cil_tmp135 = (unsigned long )mdc800;
  __cil_tmp136 = __cil_tmp135 + 32;
  __cil_tmp137 = *((struct urb **)__cil_tmp136);
  __cil_tmp138 = *((struct usb_device **)mdc800);
  __cil_tmp139 = tmp___1 | 1073741952U;
  __cil_tmp140 = (unsigned long )mdc800;
  __cil_tmp141 = __cil_tmp140 + 136;
  __cil_tmp142 = *((char **)__cil_tmp141);
  __cil_tmp143 = (void *)__cil_tmp142;
  __cil_tmp144 = (void *)mdc800;
  usb_fill_int_urb(__cil_tmp137, __cil_tmp138, __cil_tmp139, __cil_tmp143, 8, & mdc800_usb_irq,
                   __cil_tmp144, irq_interval);
  __cil_tmp145 = *((struct usb_device **)mdc800);
  __cil_tmp146 = 0 * 4UL;
  __cil_tmp147 = 12 + __cil_tmp146;
  __cil_tmp148 = (unsigned long )mdc800;
  __cil_tmp149 = __cil_tmp148 + __cil_tmp147;
  __cil_tmp150 = *((unsigned int *)__cil_tmp149);
  tmp___2 = __create_pipe(__cil_tmp145, __cil_tmp150);
  __cil_tmp151 = (unsigned long )mdc800;
  __cil_tmp152 = __cil_tmp151 + 160;
  __cil_tmp153 = *((struct urb **)__cil_tmp152);
  __cil_tmp154 = *((struct usb_device **)mdc800);
  __cil_tmp155 = tmp___2 | 3221225472U;
  __cil_tmp156 = (unsigned long )mdc800;
  __cil_tmp157 = __cil_tmp156 + 168;
  __cil_tmp158 = *((char **)__cil_tmp157);
  __cil_tmp159 = (void *)__cil_tmp158;
  __cil_tmp160 = (void *)mdc800;
  usb_fill_bulk_urb(__cil_tmp153, __cil_tmp154, __cil_tmp155, __cil_tmp159, 8, & mdc800_usb_write_notify,
                    __cil_tmp160);
  __cil_tmp161 = *((struct usb_device **)mdc800);
  __cil_tmp162 = 3 * 4UL;
  __cil_tmp163 = 12 + __cil_tmp162;
  __cil_tmp164 = (unsigned long )mdc800;
  __cil_tmp165 = __cil_tmp164 + __cil_tmp163;
  __cil_tmp166 = *((unsigned int *)__cil_tmp165);
  tmp___3 = __create_pipe(__cil_tmp161, __cil_tmp166);
  __cil_tmp167 = (unsigned long )mdc800;
  __cil_tmp168 = __cil_tmp167 + 272;
  __cil_tmp169 = *((struct urb **)__cil_tmp168);
  __cil_tmp170 = *((struct usb_device **)mdc800);
  __cil_tmp171 = tmp___3 | 3221225600U;
  __cil_tmp172 = (unsigned long )mdc800;
  __cil_tmp173 = __cil_tmp172 + 280;
  __cil_tmp174 = *((char **)__cil_tmp173);
  __cil_tmp175 = (void *)__cil_tmp174;
  __cil_tmp176 = (void *)mdc800;
  usb_fill_bulk_urb(__cil_tmp169, __cil_tmp170, __cil_tmp171, __cil_tmp175, 64, & mdc800_usb_download_notify,
                    __cil_tmp176);
  __cil_tmp177 = (unsigned long )mdc800;
  __cil_tmp178 = __cil_tmp177 + 8;
  *((mdc800_state *)__cil_tmp178) = (mdc800_state )1;
  __cil_tmp179 = (unsigned long )mdc800;
  __cil_tmp180 = __cil_tmp179 + 464;
  __cil_tmp181 = (struct mutex *)__cil_tmp180;
  mutex_unlock(__cil_tmp181);
  __cil_tmp182 = (void *)mdc800;
  usb_set_intfdata(intf, __cil_tmp182);
  }
  return (0);
}
}
static void mdc800_usb_disconnect(struct usb_interface *intf )
{ struct mdc800_data *mdc800___0 ;
  void *tmp ;
  struct mdc800_data *__cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  unsigned long __cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  mdc800_state __cil_tmp9 ;
  unsigned int __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  struct mutex *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  struct urb *__cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  struct urb *__cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  struct urb *__cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct mutex *__cil_tmp27 ;
  void *__cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  struct device *__cil_tmp31 ;
  struct device const *__cil_tmp32 ;
  {
  {
  tmp = usb_get_intfdata(intf);
  mdc800___0 = (struct mdc800_data *)tmp;
  }
  {
  __cil_tmp4 = (struct mdc800_data *)0;
  __cil_tmp5 = (unsigned long )__cil_tmp4;
  __cil_tmp6 = (unsigned long )mdc800___0;
  if (__cil_tmp6 != __cil_tmp5) {
    {
    __cil_tmp7 = (unsigned long )mdc800___0;
    __cil_tmp8 = __cil_tmp7 + 8;
    __cil_tmp9 = *((mdc800_state *)__cil_tmp8);
    __cil_tmp10 = (unsigned int )__cil_tmp9;
    if (__cil_tmp10 == 0U) {
      return;
    } else {
    }
    }
    {
    usb_deregister_dev(intf, & mdc800_class);
    __cil_tmp11 = (unsigned long )mdc800___0;
    __cil_tmp12 = __cil_tmp11 + 464;
    __cil_tmp13 = (struct mutex *)__cil_tmp12;
    mutex_lock_nested(__cil_tmp13, 0U);
    __cil_tmp14 = (unsigned long )mdc800___0;
    __cil_tmp15 = __cil_tmp14 + 8;
    *((mdc800_state *)__cil_tmp15) = (mdc800_state )0;
    __cil_tmp16 = (unsigned long )mdc800___0;
    __cil_tmp17 = __cil_tmp16 + 32;
    __cil_tmp18 = *((struct urb **)__cil_tmp17);
    usb_kill_urb(__cil_tmp18);
    __cil_tmp19 = (unsigned long )mdc800___0;
    __cil_tmp20 = __cil_tmp19 + 160;
    __cil_tmp21 = *((struct urb **)__cil_tmp20);
    usb_kill_urb(__cil_tmp21);
    __cil_tmp22 = (unsigned long )mdc800___0;
    __cil_tmp23 = __cil_tmp22 + 272;
    __cil_tmp24 = *((struct urb **)__cil_tmp23);
    usb_kill_urb(__cil_tmp24);
    __cil_tmp25 = (unsigned long )mdc800___0;
    __cil_tmp26 = __cil_tmp25 + 464;
    __cil_tmp27 = (struct mutex *)__cil_tmp26;
    mutex_unlock(__cil_tmp27);
    *((struct usb_device **)mdc800___0) = (struct usb_device *)0;
    __cil_tmp28 = (void *)0;
    usb_set_intfdata(intf, __cil_tmp28);
    }
  } else {
  }
  }
  {
  __cil_tmp29 = (unsigned long )intf;
  __cil_tmp30 = __cil_tmp29 + 48;
  __cil_tmp31 = (struct device *)__cil_tmp30;
  __cil_tmp32 = (struct device const *)__cil_tmp31;
  _dev_info(__cil_tmp32, "Mustek MDC800 disconnected from USB.\n");
  }
  return;
}
}
static int mdc800_getAnswerSize(char command )
{ unsigned char __cil_tmp2 ;
  unsigned long __cil_tmp3 ;
  unsigned long __cil_tmp4 ;
  {
  {
  __cil_tmp2 = (unsigned char )command;
  if ((int )__cil_tmp2 == 42) {
    goto case_42;
  } else
  if ((int )__cil_tmp2 == 73) {
    goto case_73;
  } else
  if ((int )__cil_tmp2 == 81) {
    goto case_81;
  } else
  if ((int )__cil_tmp2 == 13) {
    goto case_13;
  } else
  if ((int )__cil_tmp2 == 32) {
    goto case_32;
  } else
  if ((int )__cil_tmp2 == 7) {
    goto case_7;
  } else
  if ((int )__cil_tmp2 == 1) {
    goto case_1;
  } else
  if ((int )__cil_tmp2 == 37) {
    goto case_37;
  } else
  if ((int )__cil_tmp2 == 0) {
    goto case_0;
  } else
  if ((int )__cil_tmp2 == 5) {
    goto case_5;
  } else
  if ((int )__cil_tmp2 == 62) {
    goto case_62;
  } else
  if ((int )__cil_tmp2 == 9) {
    goto case_9;
  } else {
    {
    goto switch_default;
    if (0) {
      case_42: ;
      case_73: ;
      case_81: ;
      case_13: ;
      case_32: ;
      case_7: ;
      case_1: ;
      case_37: ;
      case_0: ;
      return (8);
      case_5: ;
      case_62: ;
      {
      __cil_tmp3 = (unsigned long )mdc800;
      __cil_tmp4 = __cil_tmp3 + 648;
      return (*((int *)__cil_tmp4));
      }
      case_9: ;
      return (4096);
      switch_default: ;
      return (0);
    } else {
      switch_break: ;
    }
    }
  }
  }
}
}
static int mdc800_device_open(struct inode *inode , struct file *file )
{ int retval ;
  int errn ;
  unsigned long __cil_tmp5 ;
  unsigned long __cil_tmp6 ;
  struct mutex *__cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  unsigned long __cil_tmp9 ;
  mdc800_state __cil_tmp10 ;
  unsigned int __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  int __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
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
  struct urb *__cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  struct urb *__cil_tmp38 ;
  struct usb_device *__cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  struct device *__cil_tmp42 ;
  struct device const *__cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  unsigned long __cil_tmp47 ;
  struct mutex *__cil_tmp48 ;
  {
  {
  retval = 0;
  errn = 0;
  __cil_tmp5 = (unsigned long )mdc800;
  __cil_tmp6 = __cil_tmp5 + 464;
  __cil_tmp7 = (struct mutex *)__cil_tmp6;
  mutex_lock_nested(__cil_tmp7, 0U);
  }
  {
  __cil_tmp8 = (unsigned long )mdc800;
  __cil_tmp9 = __cil_tmp8 + 8;
  __cil_tmp10 = *((mdc800_state *)__cil_tmp9);
  __cil_tmp11 = (unsigned int )__cil_tmp10;
  if (__cil_tmp11 == 0U) {
    errn = -16;
    goto error_out;
  } else {
  }
  }
  {
  __cil_tmp12 = (unsigned long )mdc800;
  __cil_tmp13 = __cil_tmp12 + 456;
  __cil_tmp14 = *((int *)__cil_tmp13);
  if (__cil_tmp14 != 0) {
    errn = -16;
    goto error_out;
  } else {
  }
  }
  {
  __cil_tmp15 = (unsigned long )mdc800;
  __cil_tmp16 = __cil_tmp15 + 640;
  *((int *)__cil_tmp16) = 0;
  __cil_tmp17 = (unsigned long )mdc800;
  __cil_tmp18 = __cil_tmp17 + 452;
  *((int *)__cil_tmp18) = 0;
  __cil_tmp19 = (unsigned long )mdc800;
  __cil_tmp20 = __cil_tmp19 + 448;
  *((int *)__cil_tmp20) = 0;
  __cil_tmp21 = (unsigned long )mdc800;
  __cil_tmp22 = __cil_tmp21 + 644;
  *((int *)__cil_tmp22) = 0;
  __cil_tmp23 = (unsigned long )mdc800;
  __cil_tmp24 = __cil_tmp23 + 648;
  *((int *)__cil_tmp24) = -1;
  __cil_tmp25 = (unsigned long )mdc800;
  __cil_tmp26 = __cil_tmp25 + 380;
  *((int *)__cil_tmp26) = 0;
  __cil_tmp27 = (unsigned long )mdc800;
  __cil_tmp28 = __cil_tmp27 + 144;
  *((int *)__cil_tmp28) = 0;
  __cil_tmp29 = (unsigned long )mdc800;
  __cil_tmp30 = __cil_tmp29 + 148;
  *((int *)__cil_tmp30) = 0;
  retval = 0;
  __cil_tmp31 = (unsigned long )mdc800;
  __cil_tmp32 = __cil_tmp31 + 32;
  __cil_tmp33 = *((struct urb **)__cil_tmp32);
  __cil_tmp34 = (unsigned long )__cil_tmp33;
  __cil_tmp35 = __cil_tmp34 + 72;
  *((struct usb_device **)__cil_tmp35) = *((struct usb_device **)mdc800);
  __cil_tmp36 = (unsigned long )mdc800;
  __cil_tmp37 = __cil_tmp36 + 32;
  __cil_tmp38 = *((struct urb **)__cil_tmp37);
  retval = ldv_usb_submit_urb_19(__cil_tmp38, 208U);
  }
  if (retval != 0) {
    {
    __cil_tmp39 = *((struct usb_device **)mdc800);
    __cil_tmp40 = (unsigned long )__cil_tmp39;
    __cil_tmp41 = __cil_tmp40 + 136;
    __cil_tmp42 = (struct device *)__cil_tmp41;
    __cil_tmp43 = (struct device const *)__cil_tmp42;
    dev_err(__cil_tmp43, "request USB irq fails (submit_retval=%i).\n", retval);
    errn = -5;
    }
    goto error_out;
  } else {
  }
  __cil_tmp44 = (unsigned long )mdc800;
  __cil_tmp45 = __cil_tmp44 + 456;
  *((int *)__cil_tmp45) = 1;
  error_out:
  {
  __cil_tmp46 = (unsigned long )mdc800;
  __cil_tmp47 = __cil_tmp46 + 464;
  __cil_tmp48 = (struct mutex *)__cil_tmp47;
  mutex_unlock(__cil_tmp48);
  }
  return (errn);
}
}
static int mdc800_device_release(struct inode *inode , struct file *file )
{ int retval ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  struct mutex *__cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  int __cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  mdc800_state __cil_tmp12 ;
  unsigned int __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  struct urb *__cil_tmp16 ;
  unsigned long __cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  struct urb *__cil_tmp19 ;
  unsigned long __cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  struct urb *__cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct mutex *__cil_tmp27 ;
  {
  {
  retval = 0;
  __cil_tmp4 = (unsigned long )mdc800;
  __cil_tmp5 = __cil_tmp4 + 464;
  __cil_tmp6 = (struct mutex *)__cil_tmp5;
  mutex_lock_nested(__cil_tmp6, 0U);
  }
  {
  __cil_tmp7 = (unsigned long )mdc800;
  __cil_tmp8 = __cil_tmp7 + 456;
  __cil_tmp9 = *((int *)__cil_tmp8);
  if (__cil_tmp9 != 0) {
    {
    __cil_tmp10 = (unsigned long )mdc800;
    __cil_tmp11 = __cil_tmp10 + 8;
    __cil_tmp12 = *((mdc800_state *)__cil_tmp11);
    __cil_tmp13 = (unsigned int )__cil_tmp12;
    if (__cil_tmp13 != 0U) {
      {
      __cil_tmp14 = (unsigned long )mdc800;
      __cil_tmp15 = __cil_tmp14 + 32;
      __cil_tmp16 = *((struct urb **)__cil_tmp15);
      usb_kill_urb(__cil_tmp16);
      __cil_tmp17 = (unsigned long )mdc800;
      __cil_tmp18 = __cil_tmp17 + 160;
      __cil_tmp19 = *((struct urb **)__cil_tmp18);
      usb_kill_urb(__cil_tmp19);
      __cil_tmp20 = (unsigned long )mdc800;
      __cil_tmp21 = __cil_tmp20 + 272;
      __cil_tmp22 = *((struct urb **)__cil_tmp21);
      usb_kill_urb(__cil_tmp22);
      __cil_tmp23 = (unsigned long )mdc800;
      __cil_tmp24 = __cil_tmp23 + 456;
      *((int *)__cil_tmp24) = 0;
      }
    } else {
      retval = -5;
    }
    }
  } else {
    retval = -5;
  }
  }
  {
  __cil_tmp25 = (unsigned long )mdc800;
  __cil_tmp26 = __cil_tmp25 + 464;
  __cil_tmp27 = (struct mutex *)__cil_tmp26;
  mutex_unlock(__cil_tmp27);
  }
  return (retval);
}
}
static ssize_t mdc800_device_read(struct file *file , char *buf , size_t len , loff_t *pos )
{ size_t left ;
  size_t sts ;
  char *ptr ;
  int retval ;
  struct task_struct *tmp ;
  int tmp___0 ;
  long __ret ;
  wait_queue_t __wait ;
  struct task_struct *tmp___1 ;
  int tmp___2 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  struct mutex *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  mdc800_state __cil_tmp20 ;
  unsigned int __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  unsigned long __cil_tmp23 ;
  struct mutex *__cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  mdc800_state __cil_tmp27 ;
  unsigned int __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  struct mutex *__cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  int __cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  struct mutex *__cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  struct mutex *__cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  int __cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  int __cil_tmp46 ;
  int __cil_tmp47 ;
  size_t __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  int __cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  int __cil_tmp54 ;
  int __cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  mdc800_state __cil_tmp58 ;
  unsigned int __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  unsigned long __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  struct urb *__cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  struct urb *__cil_tmp71 ;
  struct usb_device *__cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  struct device *__cil_tmp75 ;
  struct device const *__cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  struct mutex *__cil_tmp79 ;
  size_t __cil_tmp80 ;
  unsigned long __cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  int __cil_tmp83 ;
  wait_queue_t *__cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  unsigned long __cil_tmp89 ;
  unsigned long __cil_tmp90 ;
  unsigned long __cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  wait_queue_head_t *__cil_tmp94 ;
  unsigned long __cil_tmp95 ;
  unsigned long __cil_tmp96 ;
  int __cil_tmp97 ;
  unsigned long __cil_tmp98 ;
  unsigned long __cil_tmp99 ;
  wait_queue_head_t *__cil_tmp100 ;
  unsigned long __cil_tmp101 ;
  unsigned long __cil_tmp102 ;
  unsigned long __cil_tmp103 ;
  unsigned long __cil_tmp104 ;
  struct urb *__cil_tmp105 ;
  unsigned long __cil_tmp106 ;
  unsigned long __cil_tmp107 ;
  int __cil_tmp108 ;
  struct usb_device *__cil_tmp109 ;
  unsigned long __cil_tmp110 ;
  unsigned long __cil_tmp111 ;
  struct device *__cil_tmp112 ;
  struct device const *__cil_tmp113 ;
  unsigned long __cil_tmp114 ;
  unsigned long __cil_tmp115 ;
  struct urb *__cil_tmp116 ;
  unsigned long __cil_tmp117 ;
  unsigned long __cil_tmp118 ;
  int __cil_tmp119 ;
  unsigned long __cil_tmp120 ;
  unsigned long __cil_tmp121 ;
  struct mutex *__cil_tmp122 ;
  size_t __cil_tmp123 ;
  unsigned long __cil_tmp124 ;
  unsigned long __cil_tmp125 ;
  struct mutex *__cil_tmp126 ;
  void *__cil_tmp127 ;
  unsigned long __cil_tmp128 ;
  unsigned long __cil_tmp129 ;
  int __cil_tmp130 ;
  unsigned long __cil_tmp131 ;
  unsigned long __cil_tmp132 ;
  unsigned long __cil_tmp133 ;
  char (*__cil_tmp134)[64U] ;
  void const *__cil_tmp135 ;
  void const *__cil_tmp136 ;
  unsigned int __cil_tmp137 ;
  unsigned long __cil_tmp138 ;
  unsigned long __cil_tmp139 ;
  struct mutex *__cil_tmp140 ;
  unsigned long __cil_tmp141 ;
  unsigned long __cil_tmp142 ;
  unsigned int __cil_tmp143 ;
  unsigned long __cil_tmp144 ;
  unsigned long __cil_tmp145 ;
  int __cil_tmp146 ;
  unsigned int __cil_tmp147 ;
  unsigned int __cil_tmp148 ;
  unsigned long __cil_tmp149 ;
  unsigned long __cil_tmp150 ;
  struct mutex *__cil_tmp151 ;
  size_t __cil_tmp152 ;
  {
  {
  left = len;
  sts = len;
  ptr = buf;
  __cil_tmp15 = (unsigned long )mdc800;
  __cil_tmp16 = __cil_tmp15 + 464;
  __cil_tmp17 = (struct mutex *)__cil_tmp16;
  mutex_lock_nested(__cil_tmp17, 0U);
  }
  {
  __cil_tmp18 = (unsigned long )mdc800;
  __cil_tmp19 = __cil_tmp18 + 8;
  __cil_tmp20 = *((mdc800_state *)__cil_tmp19);
  __cil_tmp21 = (unsigned int )__cil_tmp20;
  if (__cil_tmp21 == 0U) {
    {
    __cil_tmp22 = (unsigned long )mdc800;
    __cil_tmp23 = __cil_tmp22 + 464;
    __cil_tmp24 = (struct mutex *)__cil_tmp23;
    mutex_unlock(__cil_tmp24);
    }
    return (-16L);
  } else {
  }
  }
  {
  __cil_tmp25 = (unsigned long )mdc800;
  __cil_tmp26 = __cil_tmp25 + 8;
  __cil_tmp27 = *((mdc800_state *)__cil_tmp26);
  __cil_tmp28 = (unsigned int )__cil_tmp27;
  if (__cil_tmp28 == 2U) {
    {
    printk("<4>mdc800: Illegal State \"working\"reached during read ?!\n");
    __cil_tmp29 = (unsigned long )mdc800;
    __cil_tmp30 = __cil_tmp29 + 464;
    __cil_tmp31 = (struct mutex *)__cil_tmp30;
    mutex_unlock(__cil_tmp31);
    }
    return (-16L);
  } else {
  }
  }
  {
  __cil_tmp32 = (unsigned long )mdc800;
  __cil_tmp33 = __cil_tmp32 + 456;
  __cil_tmp34 = *((int *)__cil_tmp33);
  if (__cil_tmp34 == 0) {
    {
    __cil_tmp35 = (unsigned long )mdc800;
    __cil_tmp36 = __cil_tmp35 + 464;
    __cil_tmp37 = (struct mutex *)__cil_tmp36;
    mutex_unlock(__cil_tmp37);
    }
    return (-16L);
  } else {
  }
  }
  goto ldv_24213;
  ldv_24212:
  {
  tmp = get_current();
  tmp___0 = signal_pending(tmp);
  }
  if (tmp___0 != 0) {
    {
    __cil_tmp38 = (unsigned long )mdc800;
    __cil_tmp39 = __cil_tmp38 + 464;
    __cil_tmp40 = (struct mutex *)__cil_tmp39;
    mutex_unlock(__cil_tmp40);
    }
    return (-4L);
  } else {
  }
  {
  __cil_tmp41 = (unsigned long )mdc800;
  __cil_tmp42 = __cil_tmp41 + 448;
  __cil_tmp43 = *((int *)__cil_tmp42);
  __cil_tmp44 = (unsigned long )mdc800;
  __cil_tmp45 = __cil_tmp44 + 452;
  __cil_tmp46 = *((int *)__cil_tmp45);
  __cil_tmp47 = __cil_tmp46 - __cil_tmp43;
  __cil_tmp48 = (size_t )__cil_tmp47;
  if (left < __cil_tmp48) {
    sts = left;
  } else {
    __cil_tmp49 = (unsigned long )mdc800;
    __cil_tmp50 = __cil_tmp49 + 448;
    __cil_tmp51 = *((int *)__cil_tmp50);
    __cil_tmp52 = (unsigned long )mdc800;
    __cil_tmp53 = __cil_tmp52 + 452;
    __cil_tmp54 = *((int *)__cil_tmp53);
    __cil_tmp55 = __cil_tmp54 - __cil_tmp51;
    sts = (size_t )__cil_tmp55;
  }
  }
  if (sts == 0UL) {
    {
    __cil_tmp56 = (unsigned long )mdc800;
    __cil_tmp57 = __cil_tmp56 + 8;
    __cil_tmp58 = *((mdc800_state *)__cil_tmp57);
    __cil_tmp59 = (unsigned int )__cil_tmp58;
    if (__cil_tmp59 == 3U) {
      {
      __cil_tmp60 = (unsigned long )mdc800;
      __cil_tmp61 = __cil_tmp60 + 452;
      *((int *)__cil_tmp61) = 0;
      __cil_tmp62 = (unsigned long )mdc800;
      __cil_tmp63 = __cil_tmp62 + 448;
      *((int *)__cil_tmp63) = 0;
      __cil_tmp64 = (unsigned long )mdc800;
      __cil_tmp65 = __cil_tmp64 + 272;
      __cil_tmp66 = *((struct urb **)__cil_tmp65);
      __cil_tmp67 = (unsigned long )__cil_tmp66;
      __cil_tmp68 = __cil_tmp67 + 72;
      *((struct usb_device **)__cil_tmp68) = *((struct usb_device **)mdc800);
      __cil_tmp69 = (unsigned long )mdc800;
      __cil_tmp70 = __cil_tmp69 + 272;
      __cil_tmp71 = *((struct urb **)__cil_tmp70);
      retval = ldv_usb_submit_urb_20(__cil_tmp71, 208U);
      }
      if (retval != 0) {
        {
        __cil_tmp72 = *((struct usb_device **)mdc800);
        __cil_tmp73 = (unsigned long )__cil_tmp72;
        __cil_tmp74 = __cil_tmp73 + 136;
        __cil_tmp75 = (struct device *)__cil_tmp74;
        __cil_tmp76 = (struct device const *)__cil_tmp75;
        dev_err(__cil_tmp76, "Can\'t submit download urb (retval=%i)\n", retval);
        __cil_tmp77 = (unsigned long )mdc800;
        __cil_tmp78 = __cil_tmp77 + 464;
        __cil_tmp79 = (struct mutex *)__cil_tmp78;
        mutex_unlock(__cil_tmp79);
        }
        {
        __cil_tmp80 = len - left;
        return ((ssize_t )__cil_tmp80);
        }
      } else {
      }
      __ret = 375L;
      {
      __cil_tmp81 = (unsigned long )mdc800;
      __cil_tmp82 = __cil_tmp81 + 376;
      __cil_tmp83 = *((int *)__cil_tmp82);
      if (__cil_tmp83 == 0) {
        {
        tmp___1 = get_current();
        __cil_tmp84 = & __wait;
        *((unsigned int *)__cil_tmp84) = 0U;
        __cil_tmp85 = (unsigned long )(& __wait) + 8;
        *((void **)__cil_tmp85) = (void *)tmp___1;
        __cil_tmp86 = (unsigned long )(& __wait) + 16;
        *((int (**)(wait_queue_t * , unsigned int , int , void * ))__cil_tmp86) = & autoremove_wake_function;
        __cil_tmp87 = (unsigned long )(& __wait) + 24;
        __cil_tmp88 = (unsigned long )(& __wait) + 24;
        *((struct list_head **)__cil_tmp87) = (struct list_head *)__cil_tmp88;
        __cil_tmp89 = 24 + 8;
        __cil_tmp90 = (unsigned long )(& __wait) + __cil_tmp89;
        __cil_tmp91 = (unsigned long )(& __wait) + 24;
        *((struct list_head **)__cil_tmp90) = (struct list_head *)__cil_tmp91;
        }
        ldv_24210:
        {
        __cil_tmp92 = (unsigned long )mdc800;
        __cil_tmp93 = __cil_tmp92 + 288;
        __cil_tmp94 = (wait_queue_head_t *)__cil_tmp93;
        prepare_to_wait(__cil_tmp94, & __wait, 2);
        }
        {
        __cil_tmp95 = (unsigned long )mdc800;
        __cil_tmp96 = __cil_tmp95 + 376;
        __cil_tmp97 = *((int *)__cil_tmp96);
        if (__cil_tmp97 != 0) {
          goto ldv_24209;
        } else {
        }
        }
        {
        __ret = schedule_timeout(__ret);
        }
        if (__ret == 0L) {
          goto ldv_24209;
        } else {
        }
        goto ldv_24210;
        ldv_24209:
        {
        __cil_tmp98 = (unsigned long )mdc800;
        __cil_tmp99 = __cil_tmp98 + 288;
        __cil_tmp100 = (wait_queue_head_t *)__cil_tmp99;
        finish_wait(__cil_tmp100, & __wait);
        }
      } else {
      }
      }
      __cil_tmp101 = (unsigned long )mdc800;
      __cil_tmp102 = __cil_tmp101 + 376;
      *((int *)__cil_tmp102) = 0;
      {
      __cil_tmp103 = (unsigned long )mdc800;
      __cil_tmp104 = __cil_tmp103 + 272;
      __cil_tmp105 = *((struct urb **)__cil_tmp104);
      __cil_tmp106 = (unsigned long )__cil_tmp105;
      __cil_tmp107 = __cil_tmp106 + 96;
      __cil_tmp108 = *((int *)__cil_tmp107);
      if (__cil_tmp108 != 0) {
        {
        __cil_tmp109 = *((struct usb_device **)mdc800);
        __cil_tmp110 = (unsigned long )__cil_tmp109;
        __cil_tmp111 = __cil_tmp110 + 136;
        __cil_tmp112 = (struct device *)__cil_tmp111;
        __cil_tmp113 = (struct device const *)__cil_tmp112;
        __cil_tmp114 = (unsigned long )mdc800;
        __cil_tmp115 = __cil_tmp114 + 272;
        __cil_tmp116 = *((struct urb **)__cil_tmp115);
        __cil_tmp117 = (unsigned long )__cil_tmp116;
        __cil_tmp118 = __cil_tmp117 + 96;
        __cil_tmp119 = *((int *)__cil_tmp118);
        dev_err(__cil_tmp113, "request download-bytes fails (status=%i)\n", __cil_tmp119);
        __cil_tmp120 = (unsigned long )mdc800;
        __cil_tmp121 = __cil_tmp120 + 464;
        __cil_tmp122 = (struct mutex *)__cil_tmp121;
        mutex_unlock(__cil_tmp122);
        }
        {
        __cil_tmp123 = len - left;
        return ((ssize_t )__cil_tmp123);
        }
      } else {
      }
      }
    } else {
      {
      __cil_tmp124 = (unsigned long )mdc800;
      __cil_tmp125 = __cil_tmp124 + 464;
      __cil_tmp126 = (struct mutex *)__cil_tmp125;
      mutex_unlock(__cil_tmp126);
      }
      return (-5L);
    }
    }
  } else {
    {
    __cil_tmp127 = (void *)ptr;
    __cil_tmp128 = (unsigned long )mdc800;
    __cil_tmp129 = __cil_tmp128 + 448;
    __cil_tmp130 = *((int *)__cil_tmp129);
    __cil_tmp131 = (unsigned long )__cil_tmp130;
    __cil_tmp132 = (unsigned long )mdc800;
    __cil_tmp133 = __cil_tmp132 + 384;
    __cil_tmp134 = (char (*)[64U])__cil_tmp133;
    __cil_tmp135 = (void const *)__cil_tmp134;
    __cil_tmp136 = __cil_tmp135 + __cil_tmp131;
    __cil_tmp137 = (unsigned int )sts;
    tmp___2 = copy_to_user(__cil_tmp127, __cil_tmp136, __cil_tmp137);
    }
    if (tmp___2 != 0) {
      {
      __cil_tmp138 = (unsigned long )mdc800;
      __cil_tmp139 = __cil_tmp138 + 464;
      __cil_tmp140 = (struct mutex *)__cil_tmp139;
      mutex_unlock(__cil_tmp140);
      }
      return (-14L);
    } else {
    }
    ptr = ptr + sts;
    left = left - sts;
    __cil_tmp141 = (unsigned long )mdc800;
    __cil_tmp142 = __cil_tmp141 + 448;
    __cil_tmp143 = (unsigned int )sts;
    __cil_tmp144 = (unsigned long )mdc800;
    __cil_tmp145 = __cil_tmp144 + 448;
    __cil_tmp146 = *((int *)__cil_tmp145);
    __cil_tmp147 = (unsigned int )__cil_tmp146;
    __cil_tmp148 = __cil_tmp147 + __cil_tmp143;
    *((int *)__cil_tmp142) = (int )__cil_tmp148;
  }
  ldv_24213: ;
  if (left != 0UL) {
    goto ldv_24212;
  } else {
    goto ldv_24214;
  }
  ldv_24214:
  {
  __cil_tmp149 = (unsigned long )mdc800;
  __cil_tmp150 = __cil_tmp149 + 464;
  __cil_tmp151 = (struct mutex *)__cil_tmp150;
  mutex_unlock(__cil_tmp151);
  }
  {
  __cil_tmp152 = len - left;
  return ((ssize_t )__cil_tmp152);
  }
}
}
static ssize_t mdc800_device_write(struct file *file , char const *buf , size_t len ,
                                   loff_t *pos )
{ size_t i ;
  int retval ;
  unsigned char c ;
  struct task_struct *tmp ;
  int tmp___0 ;
  int __ret_gu ;
  unsigned long __val_gu ;
  int answersize ;
  int tmp___1 ;
  size_t __len ;
  void *__ret ;
  long __ret___0 ;
  wait_queue_t __wait ;
  struct task_struct *tmp___2 ;
  int tmp___3 ;
  size_t __len___0 ;
  void *__ret___1 ;
  size_t __len___1 ;
  void *__ret___2 ;
  int tmp___4 ;
  unsigned long __cil_tmp25 ;
  unsigned long __cil_tmp26 ;
  struct mutex *__cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  mdc800_state __cil_tmp30 ;
  unsigned int __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  struct mutex *__cil_tmp34 ;
  unsigned long __cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  int __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  unsigned long __cil_tmp39 ;
  struct mutex *__cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  struct mutex *__cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  struct mutex *__cil_tmp46 ;
  unsigned int __cil_tmp47 ;
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
  int __cil_tmp58 ;
  unsigned long __cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  int __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  unsigned long __cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  unsigned long __cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  int __cil_tmp70 ;
  unsigned long __cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  struct mutex *__cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  unsigned long __cil_tmp75 ;
  int __cil_tmp76 ;
  struct usb_device *__cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  unsigned long __cil_tmp79 ;
  struct device *__cil_tmp80 ;
  struct device const *__cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  unsigned long __cil_tmp83 ;
  struct mutex *__cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  unsigned long __cil_tmp86 ;
  unsigned long __cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  char __cil_tmp89 ;
  int __cil_tmp90 ;
  char __cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  unsigned long __cil_tmp94 ;
  unsigned long __cil_tmp95 ;
  struct urb *__cil_tmp96 ;
  unsigned long __cil_tmp97 ;
  unsigned long __cil_tmp98 ;
  void *__cil_tmp99 ;
  unsigned long __cil_tmp100 ;
  unsigned long __cil_tmp101 ;
  char (*__cil_tmp102)[8U] ;
  void const *__cil_tmp103 ;
  unsigned long __cil_tmp104 ;
  unsigned long __cil_tmp105 ;
  struct urb *__cil_tmp106 ;
  unsigned long __cil_tmp107 ;
  unsigned long __cil_tmp108 ;
  void *__cil_tmp109 ;
  unsigned long __cil_tmp110 ;
  unsigned long __cil_tmp111 ;
  char (*__cil_tmp112)[8U] ;
  void const *__cil_tmp113 ;
  unsigned long __cil_tmp114 ;
  unsigned long __cil_tmp115 ;
  struct urb *__cil_tmp116 ;
  unsigned long __cil_tmp117 ;
  unsigned long __cil_tmp118 ;
  unsigned long __cil_tmp119 ;
  unsigned long __cil_tmp120 ;
  struct urb *__cil_tmp121 ;
  struct usb_device *__cil_tmp122 ;
  unsigned long __cil_tmp123 ;
  unsigned long __cil_tmp124 ;
  struct device *__cil_tmp125 ;
  struct device const *__cil_tmp126 ;
  unsigned long __cil_tmp127 ;
  unsigned long __cil_tmp128 ;
  struct mutex *__cil_tmp129 ;
  unsigned long __cil_tmp130 ;
  unsigned long __cil_tmp131 ;
  int __cil_tmp132 ;
  wait_queue_t *__cil_tmp133 ;
  unsigned long __cil_tmp134 ;
  unsigned long __cil_tmp135 ;
  unsigned long __cil_tmp136 ;
  unsigned long __cil_tmp137 ;
  unsigned long __cil_tmp138 ;
  unsigned long __cil_tmp139 ;
  unsigned long __cil_tmp140 ;
  unsigned long __cil_tmp141 ;
  unsigned long __cil_tmp142 ;
  wait_queue_head_t *__cil_tmp143 ;
  unsigned long __cil_tmp144 ;
  unsigned long __cil_tmp145 ;
  int __cil_tmp146 ;
  unsigned long __cil_tmp147 ;
  unsigned long __cil_tmp148 ;
  wait_queue_head_t *__cil_tmp149 ;
  unsigned long __cil_tmp150 ;
  unsigned long __cil_tmp151 ;
  unsigned long __cil_tmp152 ;
  unsigned long __cil_tmp153 ;
  mdc800_state __cil_tmp154 ;
  unsigned int __cil_tmp155 ;
  unsigned long __cil_tmp156 ;
  unsigned long __cil_tmp157 ;
  struct urb *__cil_tmp158 ;
  unsigned long __cil_tmp159 ;
  unsigned long __cil_tmp160 ;
  struct mutex *__cil_tmp161 ;
  unsigned long __cil_tmp162 ;
  unsigned long __cil_tmp163 ;
  unsigned long __cil_tmp164 ;
  unsigned long __cil_tmp165 ;
  char __cil_tmp166 ;
  unsigned char __cil_tmp167 ;
  unsigned long __cil_tmp168 ;
  unsigned long __cil_tmp169 ;
  int __cil_tmp170 ;
  struct usb_device *__cil_tmp171 ;
  unsigned long __cil_tmp172 ;
  unsigned long __cil_tmp173 ;
  struct device *__cil_tmp174 ;
  struct device const *__cil_tmp175 ;
  unsigned long __cil_tmp176 ;
  unsigned long __cil_tmp177 ;
  unsigned long __cil_tmp178 ;
  unsigned long __cil_tmp179 ;
  struct mutex *__cil_tmp180 ;
  unsigned long __cil_tmp181 ;
  unsigned long __cil_tmp182 ;
  unsigned long __cil_tmp183 ;
  unsigned long __cil_tmp184 ;
  unsigned long __cil_tmp185 ;
  unsigned long __cil_tmp186 ;
  struct usb_device *__cil_tmp187 ;
  unsigned long __cil_tmp188 ;
  unsigned long __cil_tmp189 ;
  struct device *__cil_tmp190 ;
  struct device const *__cil_tmp191 ;
  unsigned long __cil_tmp192 ;
  unsigned long __cil_tmp193 ;
  struct mutex *__cil_tmp194 ;
  unsigned long __cil_tmp195 ;
  unsigned long __cil_tmp196 ;
  char (*__cil_tmp197)[64U] ;
  void *__cil_tmp198 ;
  unsigned long __cil_tmp199 ;
  unsigned long __cil_tmp200 ;
  char (*__cil_tmp201)[8U] ;
  void const *__cil_tmp202 ;
  unsigned long __cil_tmp203 ;
  unsigned long __cil_tmp204 ;
  char (*__cil_tmp205)[64U] ;
  void *__cil_tmp206 ;
  unsigned long __cil_tmp207 ;
  unsigned long __cil_tmp208 ;
  char (*__cil_tmp209)[8U] ;
  void const *__cil_tmp210 ;
  unsigned long __cil_tmp211 ;
  unsigned long __cil_tmp212 ;
  char (*__cil_tmp213)[64U] ;
  void *__cil_tmp214 ;
  void *__cil_tmp215 ;
  unsigned long __cil_tmp216 ;
  unsigned long __cil_tmp217 ;
  char (*__cil_tmp218)[8U] ;
  void const *__cil_tmp219 ;
  unsigned long __cil_tmp220 ;
  unsigned long __cil_tmp221 ;
  char (*__cil_tmp222)[64U] ;
  void *__cil_tmp223 ;
  void *__cil_tmp224 ;
  unsigned long __cil_tmp225 ;
  unsigned long __cil_tmp226 ;
  char (*__cil_tmp227)[8U] ;
  void const *__cil_tmp228 ;
  unsigned long __cil_tmp229 ;
  unsigned long __cil_tmp230 ;
  unsigned long __cil_tmp231 ;
  unsigned long __cil_tmp232 ;
  unsigned long __cil_tmp233 ;
  unsigned long __cil_tmp234 ;
  unsigned long __cil_tmp235 ;
  unsigned long __cil_tmp236 ;
  char __cil_tmp237 ;
  signed char __cil_tmp238 ;
  int __cil_tmp239 ;
  unsigned long __cil_tmp240 ;
  unsigned long __cil_tmp241 ;
  unsigned long __cil_tmp242 ;
  unsigned long __cil_tmp243 ;
  unsigned long __cil_tmp244 ;
  unsigned long __cil_tmp245 ;
  char __cil_tmp246 ;
  unsigned char __cil_tmp247 ;
  int __cil_tmp248 ;
  unsigned long __cil_tmp249 ;
  unsigned long __cil_tmp250 ;
  unsigned long __cil_tmp251 ;
  unsigned long __cil_tmp252 ;
  char __cil_tmp253 ;
  unsigned char __cil_tmp254 ;
  int __cil_tmp255 ;
  unsigned long __cil_tmp256 ;
  unsigned long __cil_tmp257 ;
  unsigned long __cil_tmp258 ;
  unsigned long __cil_tmp259 ;
  char __cil_tmp260 ;
  unsigned char __cil_tmp261 ;
  int __cil_tmp262 ;
  int __cil_tmp263 ;
  int __cil_tmp264 ;
  int __cil_tmp265 ;
  struct usb_device *__cil_tmp266 ;
  unsigned long __cil_tmp267 ;
  unsigned long __cil_tmp268 ;
  struct device *__cil_tmp269 ;
  struct device const *__cil_tmp270 ;
  unsigned long __cil_tmp271 ;
  unsigned long __cil_tmp272 ;
  struct mutex *__cil_tmp273 ;
  unsigned long __cil_tmp274 ;
  unsigned long __cil_tmp275 ;
  unsigned long __cil_tmp276 ;
  unsigned long __cil_tmp277 ;
  struct mutex *__cil_tmp278 ;
  {
  {
  i = 0UL;
  __cil_tmp25 = (unsigned long )mdc800;
  __cil_tmp26 = __cil_tmp25 + 464;
  __cil_tmp27 = (struct mutex *)__cil_tmp26;
  mutex_lock_nested(__cil_tmp27, 0U);
  }
  {
  __cil_tmp28 = (unsigned long )mdc800;
  __cil_tmp29 = __cil_tmp28 + 8;
  __cil_tmp30 = *((mdc800_state *)__cil_tmp29);
  __cil_tmp31 = (unsigned int )__cil_tmp30;
  if (__cil_tmp31 != 1U) {
    {
    __cil_tmp32 = (unsigned long )mdc800;
    __cil_tmp33 = __cil_tmp32 + 464;
    __cil_tmp34 = (struct mutex *)__cil_tmp33;
    mutex_unlock(__cil_tmp34);
    }
    return (-16L);
  } else {
  }
  }
  {
  __cil_tmp35 = (unsigned long )mdc800;
  __cil_tmp36 = __cil_tmp35 + 456;
  __cil_tmp37 = *((int *)__cil_tmp36);
  if (__cil_tmp37 == 0) {
    {
    __cil_tmp38 = (unsigned long )mdc800;
    __cil_tmp39 = __cil_tmp38 + 464;
    __cil_tmp40 = (struct mutex *)__cil_tmp39;
    mutex_unlock(__cil_tmp40);
    }
    return (-16L);
  } else {
  }
  }
  goto ldv_24254;
  ldv_24253:
  {
  tmp = get_current();
  tmp___0 = signal_pending(tmp);
  }
  if (tmp___0 != 0) {
    {
    __cil_tmp41 = (unsigned long )mdc800;
    __cil_tmp42 = __cil_tmp41 + 464;
    __cil_tmp43 = (struct mutex *)__cil_tmp42;
    mutex_unlock(__cil_tmp43);
    }
    return (-4L);
  } else {
  }
  {
  might_fault();
  }
  if (1 == 1) {
    goto case_1;
  } else
  if (1 == 2) {
    goto case_2;
  } else
  if (1 == 4) {
    goto case_4;
  } else
  if (1 == 8) {
    goto case_8;
  } else {
    {
    goto switch_default;
    if (0) {
      case_1:
      __asm__ volatile ("call __get_user_1": "=a" (__ret_gu), "=d" (__val_gu): "0" (buf + i));
      goto ldv_24227;
      case_2:
      __asm__ volatile ("call __get_user_2": "=a" (__ret_gu), "=d" (__val_gu): "0" (buf + i));
      goto ldv_24227;
      case_4:
      __asm__ volatile ("call __get_user_4": "=a" (__ret_gu), "=d" (__val_gu): "0" (buf + i));
      goto ldv_24227;
      case_8:
      __asm__ volatile ("call __get_user_8": "=a" (__ret_gu), "=d" (__val_gu): "0" (buf + i));
      goto ldv_24227;
      switch_default:
      __asm__ volatile ("call __get_user_X": "=a" (__ret_gu), "=d" (__val_gu): "0" (buf + i));
      goto ldv_24227;
    } else {
      switch_break: ;
    }
    }
  }
  ldv_24227:
  c = (unsigned char )__val_gu;
  if (__ret_gu != 0) {
    {
    __cil_tmp44 = (unsigned long )mdc800;
    __cil_tmp45 = __cil_tmp44 + 464;
    __cil_tmp46 = (struct mutex *)__cil_tmp45;
    mutex_unlock(__cil_tmp46);
    }
    return (-14L);
  } else {
  }
  {
  __cil_tmp47 = (unsigned int )c;
  if (__cil_tmp47 == 85U) {
    __cil_tmp48 = (unsigned long )mdc800;
    __cil_tmp49 = __cil_tmp48 + 640;
    *((int *)__cil_tmp49) = 0;
    __cil_tmp50 = (unsigned long )mdc800;
    __cil_tmp51 = __cil_tmp50 + 452;
    *((int *)__cil_tmp51) = 0;
    __cil_tmp52 = (unsigned long )mdc800;
    __cil_tmp53 = __cil_tmp52 + 448;
    *((int *)__cil_tmp53) = 0;
    __cil_tmp54 = (unsigned long )mdc800;
    __cil_tmp55 = __cil_tmp54 + 380;
    *((int *)__cil_tmp55) = 0;
  } else {
  }
  }
  {
  __cil_tmp56 = (unsigned long )mdc800;
  __cil_tmp57 = __cil_tmp56 + 640;
  __cil_tmp58 = *((int *)__cil_tmp57);
  if (__cil_tmp58 <= 7) {
    __cil_tmp59 = (unsigned long )mdc800;
    __cil_tmp60 = __cil_tmp59 + 640;
    __cil_tmp61 = *((int *)__cil_tmp60);
    __cil_tmp62 = __cil_tmp61 * 1UL;
    __cil_tmp63 = 632 + __cil_tmp62;
    __cil_tmp64 = (unsigned long )mdc800;
    __cil_tmp65 = __cil_tmp64 + __cil_tmp63;
    *((char *)__cil_tmp65) = (char )c;
    __cil_tmp66 = (unsigned long )mdc800;
    __cil_tmp67 = __cil_tmp66 + 640;
    __cil_tmp68 = (unsigned long )mdc800;
    __cil_tmp69 = __cil_tmp68 + 640;
    __cil_tmp70 = *((int *)__cil_tmp69);
    *((int *)__cil_tmp67) = __cil_tmp70 + 1;
  } else {
    {
    __cil_tmp71 = (unsigned long )mdc800;
    __cil_tmp72 = __cil_tmp71 + 464;
    __cil_tmp73 = (struct mutex *)__cil_tmp72;
    mutex_unlock(__cil_tmp73);
    }
    return (-5L);
  }
  }
  {
  __cil_tmp74 = (unsigned long )mdc800;
  __cil_tmp75 = __cil_tmp74 + 640;
  __cil_tmp76 = *((int *)__cil_tmp75);
  if (__cil_tmp76 == 8) {
    {
    tmp___1 = mdc800_usb_waitForIRQ(0, 5000);
    }
    if (tmp___1 != 0) {
      {
      __cil_tmp77 = *((struct usb_device **)mdc800);
      __cil_tmp78 = (unsigned long )__cil_tmp77;
      __cil_tmp79 = __cil_tmp78 + 136;
      __cil_tmp80 = (struct device *)__cil_tmp79;
      __cil_tmp81 = (struct device const *)__cil_tmp80;
      dev_err(__cil_tmp81, "Camera didn\'t get ready.\n");
      __cil_tmp82 = (unsigned long )mdc800;
      __cil_tmp83 = __cil_tmp82 + 464;
      __cil_tmp84 = (struct mutex *)__cil_tmp83;
      mutex_unlock(__cil_tmp84);
      }
      return (-5L);
    } else {
    }
    {
    __cil_tmp85 = 1 * 1UL;
    __cil_tmp86 = 632 + __cil_tmp85;
    __cil_tmp87 = (unsigned long )mdc800;
    __cil_tmp88 = __cil_tmp87 + __cil_tmp86;
    __cil_tmp89 = *((char *)__cil_tmp88);
    __cil_tmp90 = (int )__cil_tmp89;
    __cil_tmp91 = (char )__cil_tmp90;
    answersize = mdc800_getAnswerSize(__cil_tmp91);
    __cil_tmp92 = (unsigned long )mdc800;
    __cil_tmp93 = __cil_tmp92 + 8;
    *((mdc800_state *)__cil_tmp93) = (mdc800_state )2;
    __len = 8UL;
    }
    if (__len > 63UL) {
      {
      __cil_tmp94 = (unsigned long )mdc800;
      __cil_tmp95 = __cil_tmp94 + 160;
      __cil_tmp96 = *((struct urb **)__cil_tmp95);
      __cil_tmp97 = (unsigned long )__cil_tmp96;
      __cil_tmp98 = __cil_tmp97 + 104;
      __cil_tmp99 = *((void **)__cil_tmp98);
      __cil_tmp100 = (unsigned long )mdc800;
      __cil_tmp101 = __cil_tmp100 + 632;
      __cil_tmp102 = (char (*)[8U])__cil_tmp101;
      __cil_tmp103 = (void const *)__cil_tmp102;
      __ret = memcpy(__cil_tmp99, __cil_tmp103, __len);
      }
    } else {
      {
      __cil_tmp104 = (unsigned long )mdc800;
      __cil_tmp105 = __cil_tmp104 + 160;
      __cil_tmp106 = *((struct urb **)__cil_tmp105);
      __cil_tmp107 = (unsigned long )__cil_tmp106;
      __cil_tmp108 = __cil_tmp107 + 104;
      __cil_tmp109 = *((void **)__cil_tmp108);
      __cil_tmp110 = (unsigned long )mdc800;
      __cil_tmp111 = __cil_tmp110 + 632;
      __cil_tmp112 = (char (*)[8U])__cil_tmp111;
      __cil_tmp113 = (void const *)__cil_tmp112;
      __ret = memcpy(__cil_tmp109, __cil_tmp113, __len);
      }
    }
    {
    __cil_tmp114 = (unsigned long )mdc800;
    __cil_tmp115 = __cil_tmp114 + 160;
    __cil_tmp116 = *((struct urb **)__cil_tmp115);
    __cil_tmp117 = (unsigned long )__cil_tmp116;
    __cil_tmp118 = __cil_tmp117 + 72;
    *((struct usb_device **)__cil_tmp118) = *((struct usb_device **)mdc800);
    __cil_tmp119 = (unsigned long )mdc800;
    __cil_tmp120 = __cil_tmp119 + 160;
    __cil_tmp121 = *((struct urb **)__cil_tmp120);
    retval = ldv_usb_submit_urb_21(__cil_tmp121, 208U);
    }
    if (retval != 0) {
      {
      __cil_tmp122 = *((struct usb_device **)mdc800);
      __cil_tmp123 = (unsigned long )__cil_tmp122;
      __cil_tmp124 = __cil_tmp123 + 136;
      __cil_tmp125 = (struct device *)__cil_tmp124;
      __cil_tmp126 = (struct device const *)__cil_tmp125;
      dev_err(__cil_tmp126, "submitting write urb fails (retval=%i)\n", retval);
      __cil_tmp127 = (unsigned long )mdc800;
      __cil_tmp128 = __cil_tmp127 + 464;
      __cil_tmp129 = (struct mutex *)__cil_tmp128;
      mutex_unlock(__cil_tmp129);
      }
      return (-5L);
    } else {
    }
    __ret___0 = 250L;
    {
    __cil_tmp130 = (unsigned long )mdc800;
    __cil_tmp131 = __cil_tmp130 + 264;
    __cil_tmp132 = *((int *)__cil_tmp131);
    if (__cil_tmp132 == 0) {
      {
      tmp___2 = get_current();
      __cil_tmp133 = & __wait;
      *((unsigned int *)__cil_tmp133) = 0U;
      __cil_tmp134 = (unsigned long )(& __wait) + 8;
      *((void **)__cil_tmp134) = (void *)tmp___2;
      __cil_tmp135 = (unsigned long )(& __wait) + 16;
      *((int (**)(wait_queue_t * , unsigned int , int , void * ))__cil_tmp135) = & autoremove_wake_function;
      __cil_tmp136 = (unsigned long )(& __wait) + 24;
      __cil_tmp137 = (unsigned long )(& __wait) + 24;
      *((struct list_head **)__cil_tmp136) = (struct list_head *)__cil_tmp137;
      __cil_tmp138 = 24 + 8;
      __cil_tmp139 = (unsigned long )(& __wait) + __cil_tmp138;
      __cil_tmp140 = (unsigned long )(& __wait) + 24;
      *((struct list_head **)__cil_tmp139) = (struct list_head *)__cil_tmp140;
      }
      ldv_24240:
      {
      __cil_tmp141 = (unsigned long )mdc800;
      __cil_tmp142 = __cil_tmp141 + 176;
      __cil_tmp143 = (wait_queue_head_t *)__cil_tmp142;
      prepare_to_wait(__cil_tmp143, & __wait, 2);
      }
      {
      __cil_tmp144 = (unsigned long )mdc800;
      __cil_tmp145 = __cil_tmp144 + 264;
      __cil_tmp146 = *((int *)__cil_tmp145);
      if (__cil_tmp146 != 0) {
        goto ldv_24239;
      } else {
      }
      }
      {
      __ret___0 = schedule_timeout(__ret___0);
      }
      if (__ret___0 == 0L) {
        goto ldv_24239;
      } else {
      }
      goto ldv_24240;
      ldv_24239:
      {
      __cil_tmp147 = (unsigned long )mdc800;
      __cil_tmp148 = __cil_tmp147 + 176;
      __cil_tmp149 = (wait_queue_head_t *)__cil_tmp148;
      finish_wait(__cil_tmp149, & __wait);
      }
    } else {
    }
    }
    __cil_tmp150 = (unsigned long )mdc800;
    __cil_tmp151 = __cil_tmp150 + 264;
    *((int *)__cil_tmp151) = 0;
    {
    __cil_tmp152 = (unsigned long )mdc800;
    __cil_tmp153 = __cil_tmp152 + 8;
    __cil_tmp154 = *((mdc800_state *)__cil_tmp153);
    __cil_tmp155 = (unsigned int )__cil_tmp154;
    if (__cil_tmp155 == 2U) {
      {
      __cil_tmp156 = (unsigned long )mdc800;
      __cil_tmp157 = __cil_tmp156 + 160;
      __cil_tmp158 = *((struct urb **)__cil_tmp157);
      usb_kill_urb(__cil_tmp158);
      __cil_tmp159 = (unsigned long )mdc800;
      __cil_tmp160 = __cil_tmp159 + 464;
      __cil_tmp161 = (struct mutex *)__cil_tmp160;
      mutex_unlock(__cil_tmp161);
      }
      return (-5L);
    } else {
    }
    }
    {
    __cil_tmp162 = 1 * 1UL;
    __cil_tmp163 = 632 + __cil_tmp162;
    __cil_tmp164 = (unsigned long )mdc800;
    __cil_tmp165 = __cil_tmp164 + __cil_tmp163;
    __cil_tmp166 = *((char *)__cil_tmp165);
    __cil_tmp167 = (unsigned char )__cil_tmp166;
    if ((int )__cil_tmp167 == 5) {
      goto case_5;
    } else
    if ((int )__cil_tmp167 == 62) {
      goto case_62;
    } else
    if ((int )__cil_tmp167 == 9) {
      goto case_9;
    } else {
      {
      goto switch_default___0;
      if (0) {
        case_5: ;
        case_62: ;
        {
        __cil_tmp168 = (unsigned long )mdc800;
        __cil_tmp169 = __cil_tmp168 + 648;
        __cil_tmp170 = *((int *)__cil_tmp169);
        if (__cil_tmp170 < 0) {
          {
          __cil_tmp171 = *((struct usb_device **)mdc800);
          __cil_tmp172 = (unsigned long )__cil_tmp171;
          __cil_tmp173 = __cil_tmp172 + 136;
          __cil_tmp174 = (struct device *)__cil_tmp173;
          __cil_tmp175 = (struct device const *)__cil_tmp174;
          dev_err(__cil_tmp175, "call 0x07 before 0x05,0x3e\n");
          __cil_tmp176 = (unsigned long )mdc800;
          __cil_tmp177 = __cil_tmp176 + 8;
          *((mdc800_state *)__cil_tmp177) = (mdc800_state )1;
          __cil_tmp178 = (unsigned long )mdc800;
          __cil_tmp179 = __cil_tmp178 + 464;
          __cil_tmp180 = (struct mutex *)__cil_tmp179;
          mutex_unlock(__cil_tmp180);
          }
          return (-5L);
        } else {
        }
        }
        __cil_tmp181 = (unsigned long )mdc800;
        __cil_tmp182 = __cil_tmp181 + 648;
        *((int *)__cil_tmp182) = -1;
        case_9:
        {
        __cil_tmp183 = (unsigned long )mdc800;
        __cil_tmp184 = __cil_tmp183 + 380;
        *((int *)__cil_tmp184) = answersize + 64;
        __cil_tmp185 = (unsigned long )mdc800;
        __cil_tmp186 = __cil_tmp185 + 8;
        *((mdc800_state *)__cil_tmp186) = (mdc800_state )3;
        mdc800_usb_waitForIRQ(0, 1500);
        }
        goto ldv_24245;
        switch_default___0: ;
        if (answersize != 0) {
          {
          tmp___3 = mdc800_usb_waitForIRQ(1, 5000);
          }
          if (tmp___3 != 0) {
            {
            __cil_tmp187 = *((struct usb_device **)mdc800);
            __cil_tmp188 = (unsigned long )__cil_tmp187;
            __cil_tmp189 = __cil_tmp188 + 136;
            __cil_tmp190 = (struct device *)__cil_tmp189;
            __cil_tmp191 = (struct device const *)__cil_tmp190;
            dev_err(__cil_tmp191, "requesting answer from irq fails\n");
            __cil_tmp192 = (unsigned long )mdc800;
            __cil_tmp193 = __cil_tmp192 + 464;
            __cil_tmp194 = (struct mutex *)__cil_tmp193;
            mutex_unlock(__cil_tmp194);
            }
            return (-5L);
          } else {
          }
          __len___0 = 8UL;
          if (__len___0 > 63UL) {
            {
            __cil_tmp195 = (unsigned long )mdc800;
            __cil_tmp196 = __cil_tmp195 + 384;
            __cil_tmp197 = (char (*)[64U])__cil_tmp196;
            __cil_tmp198 = (void *)__cil_tmp197;
            __cil_tmp199 = (unsigned long )mdc800;
            __cil_tmp200 = __cil_tmp199 + 152;
            __cil_tmp201 = (char (*)[8U])__cil_tmp200;
            __cil_tmp202 = (void const *)__cil_tmp201;
            __ret___1 = memcpy(__cil_tmp198, __cil_tmp202, __len___0);
            }
          } else {
            {
            __cil_tmp203 = (unsigned long )mdc800;
            __cil_tmp204 = __cil_tmp203 + 384;
            __cil_tmp205 = (char (*)[64U])__cil_tmp204;
            __cil_tmp206 = (void *)__cil_tmp205;
            __cil_tmp207 = (unsigned long )mdc800;
            __cil_tmp208 = __cil_tmp207 + 152;
            __cil_tmp209 = (char (*)[8U])__cil_tmp208;
            __cil_tmp210 = (void const *)__cil_tmp209;
            __ret___1 = memcpy(__cil_tmp206, __cil_tmp210, __len___0);
            }
          }
          __len___1 = 8UL;
          if (__len___1 > 63UL) {
            {
            __cil_tmp211 = (unsigned long )mdc800;
            __cil_tmp212 = __cil_tmp211 + 384;
            __cil_tmp213 = (char (*)[64U])__cil_tmp212;
            __cil_tmp214 = (void *)__cil_tmp213;
            __cil_tmp215 = __cil_tmp214 + 8U;
            __cil_tmp216 = (unsigned long )mdc800;
            __cil_tmp217 = __cil_tmp216 + 152;
            __cil_tmp218 = (char (*)[8U])__cil_tmp217;
            __cil_tmp219 = (void const *)__cil_tmp218;
            __ret___2 = memcpy(__cil_tmp215, __cil_tmp219, __len___1);
            }
          } else {
            {
            __cil_tmp220 = (unsigned long )mdc800;
            __cil_tmp221 = __cil_tmp220 + 384;
            __cil_tmp222 = (char (*)[64U])__cil_tmp221;
            __cil_tmp223 = (void *)__cil_tmp222;
            __cil_tmp224 = __cil_tmp223 + 8U;
            __cil_tmp225 = (unsigned long )mdc800;
            __cil_tmp226 = __cil_tmp225 + 152;
            __cil_tmp227 = (char (*)[8U])__cil_tmp226;
            __cil_tmp228 = (void const *)__cil_tmp227;
            __ret___2 = memcpy(__cil_tmp224, __cil_tmp228, __len___1);
            }
          }
          __cil_tmp229 = (unsigned long )mdc800;
          __cil_tmp230 = __cil_tmp229 + 448;
          *((int *)__cil_tmp230) = 0;
          __cil_tmp231 = (unsigned long )mdc800;
          __cil_tmp232 = __cil_tmp231 + 452;
          *((int *)__cil_tmp232) = 16;
          {
          __cil_tmp233 = 1 * 1UL;
          __cil_tmp234 = 632 + __cil_tmp233;
          __cil_tmp235 = (unsigned long )mdc800;
          __cil_tmp236 = __cil_tmp235 + __cil_tmp234;
          __cil_tmp237 = *((char *)__cil_tmp236);
          __cil_tmp238 = (signed char )__cil_tmp237;
          __cil_tmp239 = (int )__cil_tmp238;
          if (__cil_tmp239 == 7) {
            __cil_tmp240 = (unsigned long )mdc800;
            __cil_tmp241 = __cil_tmp240 + 648;
            __cil_tmp242 = 2 * 1UL;
            __cil_tmp243 = 152 + __cil_tmp242;
            __cil_tmp244 = (unsigned long )mdc800;
            __cil_tmp245 = __cil_tmp244 + __cil_tmp243;
            __cil_tmp246 = *((char *)__cil_tmp245);
            __cil_tmp247 = (unsigned char )__cil_tmp246;
            __cil_tmp248 = (int )__cil_tmp247;
            __cil_tmp249 = 1 * 1UL;
            __cil_tmp250 = 152 + __cil_tmp249;
            __cil_tmp251 = (unsigned long )mdc800;
            __cil_tmp252 = __cil_tmp251 + __cil_tmp250;
            __cil_tmp253 = *((char *)__cil_tmp252);
            __cil_tmp254 = (unsigned char )__cil_tmp253;
            __cil_tmp255 = (int )__cil_tmp254;
            __cil_tmp256 = 0 * 1UL;
            __cil_tmp257 = 152 + __cil_tmp256;
            __cil_tmp258 = (unsigned long )mdc800;
            __cil_tmp259 = __cil_tmp258 + __cil_tmp257;
            __cil_tmp260 = *((char *)__cil_tmp259);
            __cil_tmp261 = (unsigned char )__cil_tmp260;
            __cil_tmp262 = (int )__cil_tmp261;
            __cil_tmp263 = __cil_tmp262 * 256;
            __cil_tmp264 = __cil_tmp263 + __cil_tmp255;
            __cil_tmp265 = __cil_tmp264 * 256;
            *((int *)__cil_tmp241) = __cil_tmp265 + __cil_tmp248;
          } else {
          }
          }
        } else {
          {
          tmp___4 = mdc800_usb_waitForIRQ(0, 5000);
          }
          if (tmp___4 != 0) {
            {
            __cil_tmp266 = *((struct usb_device **)mdc800);
            __cil_tmp267 = (unsigned long )__cil_tmp266;
            __cil_tmp268 = __cil_tmp267 + 136;
            __cil_tmp269 = (struct device *)__cil_tmp268;
            __cil_tmp270 = (struct device const *)__cil_tmp269;
            dev_err(__cil_tmp270, "Command Timeout.\n");
            __cil_tmp271 = (unsigned long )mdc800;
            __cil_tmp272 = __cil_tmp271 + 464;
            __cil_tmp273 = (struct mutex *)__cil_tmp272;
            mutex_unlock(__cil_tmp273);
            }
            return (-5L);
          } else {
          }
        }
        __cil_tmp274 = (unsigned long )mdc800;
        __cil_tmp275 = __cil_tmp274 + 8;
        *((mdc800_state *)__cil_tmp275) = (mdc800_state )1;
        goto ldv_24245;
      } else {
        switch_break___0: ;
      }
      }
    }
    }
    ldv_24245: ;
  } else {
  }
  }
  i = i + 1UL;
  ldv_24254: ;
  if (i < len) {
    goto ldv_24253;
  } else {
    goto ldv_24255;
  }
  ldv_24255:
  {
  __cil_tmp276 = (unsigned long )mdc800;
  __cil_tmp277 = __cil_tmp276 + 464;
  __cil_tmp278 = (struct mutex *)__cil_tmp277;
  mutex_unlock(__cil_tmp278);
  }
  return ((ssize_t )i);
}
}
static struct file_operations const mdc800_device_ops =
     {& __this_module, & noop_llseek, & mdc800_device_read, & mdc800_device_write, (ssize_t (*)(struct kiocb * ,
                                                                                              struct iovec const * ,
                                                                                              unsigned long ,
                                                                                              loff_t ))0,
    (ssize_t (*)(struct kiocb * , struct iovec const * , unsigned long , loff_t ))0,
    (int (*)(struct file * , void * , int (*)(void * , char const * , int , loff_t ,
                                              u64 , unsigned int ) ))0, (unsigned int (*)(struct file * ,
                                                                                            struct poll_table_struct * ))0,
    (long (*)(struct file * , unsigned int , unsigned long ))0, (long (*)(struct file * ,
                                                                            unsigned int ,
                                                                            unsigned long ))0,
    (int (*)(struct file * , struct vm_area_struct * ))0, & mdc800_device_open, (int (*)(struct file * ,
                                                                                         fl_owner_t ))0,
    & mdc800_device_release, (int (*)(struct file * , loff_t , loff_t , int ))0,
    (int (*)(struct kiocb * , int ))0, (int (*)(int , struct file * , int ))0,
    (int (*)(struct file * , int , struct file_lock * ))0, (ssize_t (*)(struct file * ,
                                                                         struct page * ,
                                                                         int , size_t ,
                                                                         loff_t * ,
                                                                         int ))0,
    (unsigned long (*)(struct file * , unsigned long , unsigned long , unsigned long ,
                       unsigned long ))0, (int (*)(int ))0, (int (*)(struct file * ,
                                                                       int , struct file_lock * ))0,
    (ssize_t (*)(struct pipe_inode_info * , struct file * , loff_t * , size_t , unsigned int ))0,
    (ssize_t (*)(struct file * , loff_t * , struct pipe_inode_info * , size_t , unsigned int ))0,
    (int (*)(struct file * , long , struct file_lock ** ))0, (long (*)(struct file * ,
                                                                        int , loff_t ,
                                                                        loff_t ))0};
static struct usb_device_id const mdc800_table[2U] = { {(__u16 )3U, (__u16 )1375U, (__u16 )43008U, (unsigned short)0, (unsigned short)0,
      (unsigned char)0, (unsigned char)0, (unsigned char)0, (unsigned char)0, (unsigned char)0,
      (unsigned char)0, 0UL},
        {(unsigned short)0, (unsigned short)0, (unsigned short)0, (unsigned short)0,
      (unsigned short)0, (unsigned char)0, (unsigned char)0, (unsigned char)0, (unsigned char)0,
      (unsigned char)0, (unsigned char)0, 0UL}};
struct usb_device_id const __mod_usb_device_table ;
static struct usb_driver mdc800_usb_driver =
     {"mdc800", & mdc800_usb_probe, & mdc800_usb_disconnect, (int (*)(struct usb_interface * ,
                                                                    unsigned int ,
                                                                    void * ))0, (int (*)(struct usb_interface * ,
                                                                                         pm_message_t ))0,
    (int (*)(struct usb_interface * ))0, (int (*)(struct usb_interface * ))0, (int (*)(struct usb_interface * ))0,
    (int (*)(struct usb_interface * ))0, (struct usb_device_id const *)(& mdc800_table),
    {{{{{{0U}}, 0U, 0U, (void *)0, {(struct lock_class_key *)0, {(struct lock_class *)0,
                                                                 (struct lock_class *)0},
                                    (char const *)0, 0, 0UL}}}}, {(struct list_head *)0,
                                                                    (struct list_head *)0}},
    {{(char const *)0, (struct bus_type *)0, (struct module *)0, (char const *)0,
      (_Bool)0, (struct of_device_id const *)0, (int (*)(struct device * ))0, (int (*)(struct device * ))0,
      (void (*)(struct device * ))0, (int (*)(struct device * , pm_message_t ))0,
      (int (*)(struct device * ))0, (struct attribute_group const **)0, (struct dev_pm_ops const *)0,
      (struct driver_private *)0}, 0}, (unsigned char)0, (unsigned char)0, (unsigned char)0};
static int usb_mdc800_init(void)
{ int retval ;
  void *tmp ;
  struct lock_class_key __key ;
  struct lock_class_key __key___0 ;
  struct lock_class_key __key___1 ;
  struct lock_class_key __key___2 ;
  void *tmp___0 ;
  void *tmp___1 ;
  void *tmp___2 ;
  struct mdc800_data *__cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  unsigned long __cil_tmp12 ;
  unsigned long __cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  unsigned long __cil_tmp16 ;
  struct mutex *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  wait_queue_head_t *__cil_tmp20 ;
  unsigned long __cil_tmp21 ;
  unsigned long __cil_tmp22 ;
  wait_queue_head_t *__cil_tmp23 ;
  unsigned long __cil_tmp24 ;
  unsigned long __cil_tmp25 ;
  wait_queue_head_t *__cil_tmp26 ;
  unsigned long __cil_tmp27 ;
  unsigned long __cil_tmp28 ;
  unsigned long __cil_tmp29 ;
  unsigned long __cil_tmp30 ;
  unsigned long __cil_tmp31 ;
  unsigned long __cil_tmp32 ;
  unsigned long __cil_tmp33 ;
  unsigned long __cil_tmp34 ;
  char *__cil_tmp35 ;
  unsigned long __cil_tmp36 ;
  unsigned long __cil_tmp37 ;
  unsigned long __cil_tmp38 ;
  char *__cil_tmp39 ;
  unsigned long __cil_tmp40 ;
  unsigned long __cil_tmp41 ;
  unsigned long __cil_tmp42 ;
  char *__cil_tmp43 ;
  unsigned long __cil_tmp44 ;
  unsigned long __cil_tmp45 ;
  unsigned long __cil_tmp46 ;
  char *__cil_tmp47 ;
  unsigned long __cil_tmp48 ;
  unsigned long __cil_tmp49 ;
  unsigned long __cil_tmp50 ;
  char *__cil_tmp51 ;
  unsigned long __cil_tmp52 ;
  unsigned long __cil_tmp53 ;
  unsigned long __cil_tmp54 ;
  char *__cil_tmp55 ;
  unsigned long __cil_tmp56 ;
  unsigned long __cil_tmp57 ;
  unsigned long __cil_tmp58 ;
  struct urb *__cil_tmp59 ;
  unsigned long __cil_tmp60 ;
  unsigned long __cil_tmp61 ;
  unsigned long __cil_tmp62 ;
  struct urb *__cil_tmp63 ;
  unsigned long __cil_tmp64 ;
  unsigned long __cil_tmp65 ;
  unsigned long __cil_tmp66 ;
  struct urb *__cil_tmp67 ;
  unsigned long __cil_tmp68 ;
  unsigned long __cil_tmp69 ;
  unsigned long __cil_tmp70 ;
  struct urb *__cil_tmp71 ;
  unsigned long __cil_tmp72 ;
  unsigned long __cil_tmp73 ;
  unsigned long __cil_tmp74 ;
  struct urb *__cil_tmp75 ;
  unsigned long __cil_tmp76 ;
  unsigned long __cil_tmp77 ;
  unsigned long __cil_tmp78 ;
  struct urb *__cil_tmp79 ;
  unsigned long __cil_tmp80 ;
  struct mdc800_data *__cil_tmp81 ;
  unsigned long __cil_tmp82 ;
  unsigned long __cil_tmp83 ;
  unsigned long __cil_tmp84 ;
  unsigned long __cil_tmp85 ;
  char *__cil_tmp86 ;
  void const *__cil_tmp87 ;
  unsigned long __cil_tmp88 ;
  unsigned long __cil_tmp89 ;
  char *__cil_tmp90 ;
  void const *__cil_tmp91 ;
  unsigned long __cil_tmp92 ;
  unsigned long __cil_tmp93 ;
  char *__cil_tmp94 ;
  void const *__cil_tmp95 ;
  unsigned long __cil_tmp96 ;
  unsigned long __cil_tmp97 ;
  struct urb *__cil_tmp98 ;
  unsigned long __cil_tmp99 ;
  unsigned long __cil_tmp100 ;
  struct urb *__cil_tmp101 ;
  unsigned long __cil_tmp102 ;
  unsigned long __cil_tmp103 ;
  struct urb *__cil_tmp104 ;
  void const *__cil_tmp105 ;
  {
  {
  retval = -19;
  tmp = kzalloc(656UL, 208U);
  mdc800 = (struct mdc800_data *)tmp;
  }
  {
  __cil_tmp10 = (struct mdc800_data *)0;
  __cil_tmp11 = (unsigned long )__cil_tmp10;
  __cil_tmp12 = (unsigned long )mdc800;
  if (__cil_tmp12 == __cil_tmp11) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  *((struct usb_device **)mdc800) = (struct usb_device *)0;
  __cil_tmp13 = (unsigned long )mdc800;
  __cil_tmp14 = __cil_tmp13 + 8;
  *((mdc800_state *)__cil_tmp14) = (mdc800_state )0;
  __cil_tmp15 = (unsigned long )mdc800;
  __cil_tmp16 = __cil_tmp15 + 464;
  __cil_tmp17 = (struct mutex *)__cil_tmp16;
  __mutex_init(__cil_tmp17, "&mdc800->io_lock", & __key);
  __cil_tmp18 = (unsigned long )mdc800;
  __cil_tmp19 = __cil_tmp18 + 40;
  __cil_tmp20 = (wait_queue_head_t *)__cil_tmp19;
  __init_waitqueue_head(__cil_tmp20, "&mdc800->irq_wait", & __key___0);
  __cil_tmp21 = (unsigned long )mdc800;
  __cil_tmp22 = __cil_tmp21 + 176;
  __cil_tmp23 = (wait_queue_head_t *)__cil_tmp22;
  __init_waitqueue_head(__cil_tmp23, "&mdc800->write_wait", & __key___1);
  __cil_tmp24 = (unsigned long )mdc800;
  __cil_tmp25 = __cil_tmp24 + 288;
  __cil_tmp26 = (wait_queue_head_t *)__cil_tmp25;
  __init_waitqueue_head(__cil_tmp26, "&mdc800->download_wait", & __key___2);
  __cil_tmp27 = (unsigned long )mdc800;
  __cil_tmp28 = __cil_tmp27 + 128;
  *((int *)__cil_tmp28) = 0;
  __cil_tmp29 = (unsigned long )mdc800;
  __cil_tmp30 = __cil_tmp29 + 376;
  *((int *)__cil_tmp30) = 0;
  __cil_tmp31 = (unsigned long )mdc800;
  __cil_tmp32 = __cil_tmp31 + 264;
  *((int *)__cil_tmp32) = 0;
  tmp___0 = kmalloc(8UL, 208U);
  __cil_tmp33 = (unsigned long )mdc800;
  __cil_tmp34 = __cil_tmp33 + 136;
  *((char **)__cil_tmp34) = (char *)tmp___0;
  }
  {
  __cil_tmp35 = (char *)0;
  __cil_tmp36 = (unsigned long )__cil_tmp35;
  __cil_tmp37 = (unsigned long )mdc800;
  __cil_tmp38 = __cil_tmp37 + 136;
  __cil_tmp39 = *((char **)__cil_tmp38);
  __cil_tmp40 = (unsigned long )__cil_tmp39;
  if (__cil_tmp40 == __cil_tmp36) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  tmp___1 = kmalloc(8UL, 208U);
  __cil_tmp41 = (unsigned long )mdc800;
  __cil_tmp42 = __cil_tmp41 + 168;
  *((char **)__cil_tmp42) = (char *)tmp___1;
  }
  {
  __cil_tmp43 = (char *)0;
  __cil_tmp44 = (unsigned long )__cil_tmp43;
  __cil_tmp45 = (unsigned long )mdc800;
  __cil_tmp46 = __cil_tmp45 + 168;
  __cil_tmp47 = *((char **)__cil_tmp46);
  __cil_tmp48 = (unsigned long )__cil_tmp47;
  if (__cil_tmp48 == __cil_tmp44) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  tmp___2 = kmalloc(64UL, 208U);
  __cil_tmp49 = (unsigned long )mdc800;
  __cil_tmp50 = __cil_tmp49 + 280;
  *((char **)__cil_tmp50) = (char *)tmp___2;
  }
  {
  __cil_tmp51 = (char *)0;
  __cil_tmp52 = (unsigned long )__cil_tmp51;
  __cil_tmp53 = (unsigned long )mdc800;
  __cil_tmp54 = __cil_tmp53 + 280;
  __cil_tmp55 = *((char **)__cil_tmp54);
  __cil_tmp56 = (unsigned long )__cil_tmp55;
  if (__cil_tmp56 == __cil_tmp52) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  __cil_tmp57 = (unsigned long )mdc800;
  __cil_tmp58 = __cil_tmp57 + 32;
  *((struct urb **)__cil_tmp58) = ldv_usb_alloc_urb_22(0, 208U);
  }
  {
  __cil_tmp59 = (struct urb *)0;
  __cil_tmp60 = (unsigned long )__cil_tmp59;
  __cil_tmp61 = (unsigned long )mdc800;
  __cil_tmp62 = __cil_tmp61 + 32;
  __cil_tmp63 = *((struct urb **)__cil_tmp62);
  __cil_tmp64 = (unsigned long )__cil_tmp63;
  if (__cil_tmp64 == __cil_tmp60) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  __cil_tmp65 = (unsigned long )mdc800;
  __cil_tmp66 = __cil_tmp65 + 272;
  *((struct urb **)__cil_tmp66) = ldv_usb_alloc_urb_23(0, 208U);
  }
  {
  __cil_tmp67 = (struct urb *)0;
  __cil_tmp68 = (unsigned long )__cil_tmp67;
  __cil_tmp69 = (unsigned long )mdc800;
  __cil_tmp70 = __cil_tmp69 + 272;
  __cil_tmp71 = *((struct urb **)__cil_tmp70);
  __cil_tmp72 = (unsigned long )__cil_tmp71;
  if (__cil_tmp72 == __cil_tmp68) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  __cil_tmp73 = (unsigned long )mdc800;
  __cil_tmp74 = __cil_tmp73 + 160;
  *((struct urb **)__cil_tmp74) = ldv_usb_alloc_urb_24(0, 208U);
  }
  {
  __cil_tmp75 = (struct urb *)0;
  __cil_tmp76 = (unsigned long )__cil_tmp75;
  __cil_tmp77 = (unsigned long )mdc800;
  __cil_tmp78 = __cil_tmp77 + 160;
  __cil_tmp79 = *((struct urb **)__cil_tmp78);
  __cil_tmp80 = (unsigned long )__cil_tmp79;
  if (__cil_tmp80 == __cil_tmp76) {
    goto cleanup_on_fail;
  } else {
  }
  }
  {
  retval = usb_register_driver(& mdc800_usb_driver, & __this_module, "mdc800");
  }
  if (retval != 0) {
    goto cleanup_on_fail;
  } else {
  }
  {
  printk("<6>mdc800: v0.7.5 (30/10/2000):USB Driver for Mustek MDC800 Digital Camera\n");
  }
  return (0);
  cleanup_on_fail: ;
  {
  __cil_tmp81 = (struct mdc800_data *)0;
  __cil_tmp82 = (unsigned long )__cil_tmp81;
  __cil_tmp83 = (unsigned long )mdc800;
  if (__cil_tmp83 != __cil_tmp82) {
    {
    printk("<3>mdc800: can\'t alloc memory!\n");
    __cil_tmp84 = (unsigned long )mdc800;
    __cil_tmp85 = __cil_tmp84 + 280;
    __cil_tmp86 = *((char **)__cil_tmp85);
    __cil_tmp87 = (void const *)__cil_tmp86;
    kfree(__cil_tmp87);
    __cil_tmp88 = (unsigned long )mdc800;
    __cil_tmp89 = __cil_tmp88 + 168;
    __cil_tmp90 = *((char **)__cil_tmp89);
    __cil_tmp91 = (void const *)__cil_tmp90;
    kfree(__cil_tmp91);
    __cil_tmp92 = (unsigned long )mdc800;
    __cil_tmp93 = __cil_tmp92 + 136;
    __cil_tmp94 = *((char **)__cil_tmp93);
    __cil_tmp95 = (void const *)__cil_tmp94;
    kfree(__cil_tmp95);
    __cil_tmp96 = (unsigned long )mdc800;
    __cil_tmp97 = __cil_tmp96 + 160;
    __cil_tmp98 = *((struct urb **)__cil_tmp97);
    usb_free_urb(__cil_tmp98);
    __cil_tmp99 = (unsigned long )mdc800;
    __cil_tmp100 = __cil_tmp99 + 272;
    __cil_tmp101 = *((struct urb **)__cil_tmp100);
    usb_free_urb(__cil_tmp101);
    __cil_tmp102 = (unsigned long )mdc800;
    __cil_tmp103 = __cil_tmp102 + 32;
    __cil_tmp104 = *((struct urb **)__cil_tmp103);
    usb_free_urb(__cil_tmp104);
    __cil_tmp105 = (void const *)mdc800;
    kfree(__cil_tmp105);
    }
  } else {
  }
  }
  mdc800 = (struct mdc800_data *)0;
  return (retval);
}
}
static void usb_mdc800_cleanup(void)
{ unsigned long __cil_tmp1 ;
  unsigned long __cil_tmp2 ;
  struct urb *__cil_tmp3 ;
  unsigned long __cil_tmp4 ;
  unsigned long __cil_tmp5 ;
  struct urb *__cil_tmp6 ;
  unsigned long __cil_tmp7 ;
  unsigned long __cil_tmp8 ;
  struct urb *__cil_tmp9 ;
  unsigned long __cil_tmp10 ;
  unsigned long __cil_tmp11 ;
  char *__cil_tmp12 ;
  void const *__cil_tmp13 ;
  unsigned long __cil_tmp14 ;
  unsigned long __cil_tmp15 ;
  char *__cil_tmp16 ;
  void const *__cil_tmp17 ;
  unsigned long __cil_tmp18 ;
  unsigned long __cil_tmp19 ;
  char *__cil_tmp20 ;
  void const *__cil_tmp21 ;
  void const *__cil_tmp22 ;
  {
  {
  usb_deregister(& mdc800_usb_driver);
  __cil_tmp1 = (unsigned long )mdc800;
  __cil_tmp2 = __cil_tmp1 + 32;
  __cil_tmp3 = *((struct urb **)__cil_tmp2);
  usb_free_urb(__cil_tmp3);
  __cil_tmp4 = (unsigned long )mdc800;
  __cil_tmp5 = __cil_tmp4 + 272;
  __cil_tmp6 = *((struct urb **)__cil_tmp5);
  usb_free_urb(__cil_tmp6);
  __cil_tmp7 = (unsigned long )mdc800;
  __cil_tmp8 = __cil_tmp7 + 160;
  __cil_tmp9 = *((struct urb **)__cil_tmp8);
  usb_free_urb(__cil_tmp9);
  __cil_tmp10 = (unsigned long )mdc800;
  __cil_tmp11 = __cil_tmp10 + 136;
  __cil_tmp12 = *((char **)__cil_tmp11);
  __cil_tmp13 = (void const *)__cil_tmp12;
  kfree(__cil_tmp13);
  __cil_tmp14 = (unsigned long )mdc800;
  __cil_tmp15 = __cil_tmp14 + 168;
  __cil_tmp16 = *((char **)__cil_tmp15);
  __cil_tmp17 = (void const *)__cil_tmp16;
  kfree(__cil_tmp17);
  __cil_tmp18 = (unsigned long )mdc800;
  __cil_tmp19 = __cil_tmp18 + 280;
  __cil_tmp20 = *((char **)__cil_tmp19);
  __cil_tmp21 = (void const *)__cil_tmp20;
  kfree(__cil_tmp21);
  __cil_tmp22 = (void const *)mdc800;
  kfree(__cil_tmp22);
  mdc800 = (struct mdc800_data *)0;
  }
  return;
}
}
extern void ldv_check_final_state(void) ;
extern void ldv_check_return_value(int ) ;
extern void ldv_initialize(void) ;
extern int __VERIFIER_nondet_int(void) ;
int LDV_IN_INTERRUPT ;
void main(void)
{ struct file *var_group1 ;
  char *var_mdc800_device_read_12_p1 ;
  size_t var_mdc800_device_read_12_p2 ;
  loff_t *var_mdc800_device_read_12_p3 ;
  ssize_t res_mdc800_device_read_12 ;
  char const *var_mdc800_device_write_13_p1 ;
  size_t var_mdc800_device_write_13_p2 ;
  loff_t *var_mdc800_device_write_13_p3 ;
  ssize_t res_mdc800_device_write_13 ;
  struct inode *var_group2 ;
  int res_mdc800_device_open_10 ;
  struct usb_interface *var_group3 ;
  struct usb_device_id const *var_mdc800_usb_probe_7_p1 ;
  int res_mdc800_usb_probe_7 ;
  int ldv_s_mdc800_device_ops_file_operations ;
  int ldv_s_mdc800_usb_driver_usb_driver ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int __cil_tmp20 ;
  int __cil_tmp21 ;
  {
  {
  ldv_s_mdc800_device_ops_file_operations = 0;
  ldv_s_mdc800_usb_driver_usb_driver = 0;
  LDV_IN_INTERRUPT = 1;
  ldv_initialize();
  tmp = usb_mdc800_init();
  }
  if (tmp != 0) {
    goto ldv_final;
  } else {
  }
  goto ldv_24324;
  ldv_24323:
  {
  tmp___0 = __VERIFIER_nondet_int();
  }
  if (tmp___0 == 0) {
    goto case_0;
  } else
  if (tmp___0 == 1) {
    goto case_1;
  } else
  if (tmp___0 == 2) {
    goto case_2;
  } else
  if (tmp___0 == 3) {
    goto case_3;
  } else
  if (tmp___0 == 4) {
    goto case_4;
  } else
  if (tmp___0 == 5) {
    goto case_5;
  } else {
    {
    goto switch_default;
    if (0) {
      case_0: ;
      if (ldv_s_mdc800_device_ops_file_operations == 0) {
        {
        res_mdc800_device_open_10 = mdc800_device_open(var_group2, var_group1);
        ldv_check_return_value(res_mdc800_device_open_10);
        }
        if (res_mdc800_device_open_10 != 0) {
          goto ldv_module_exit;
        } else {
        }
        ldv_s_mdc800_device_ops_file_operations = ldv_s_mdc800_device_ops_file_operations + 1;
      } else {
      }
      goto ldv_24316;
      case_1: ;
      if (ldv_s_mdc800_device_ops_file_operations == 1) {
        {
        res_mdc800_device_read_12 = mdc800_device_read(var_group1, var_mdc800_device_read_12_p1,
                                                       var_mdc800_device_read_12_p2,
                                                       var_mdc800_device_read_12_p3);
        __cil_tmp20 = (int )res_mdc800_device_read_12;
        ldv_check_return_value(__cil_tmp20);
        }
        if (res_mdc800_device_read_12 < 0L) {
          goto ldv_module_exit;
        } else {
        }
        ldv_s_mdc800_device_ops_file_operations = ldv_s_mdc800_device_ops_file_operations + 1;
      } else {
      }
      goto ldv_24316;
      case_2: ;
      if (ldv_s_mdc800_device_ops_file_operations == 2) {
        {
        res_mdc800_device_write_13 = mdc800_device_write(var_group1, var_mdc800_device_write_13_p1,
                                                         var_mdc800_device_write_13_p2,
                                                         var_mdc800_device_write_13_p3);
        __cil_tmp21 = (int )res_mdc800_device_write_13;
        ldv_check_return_value(__cil_tmp21);
        }
        if (res_mdc800_device_write_13 < 0L) {
          goto ldv_module_exit;
        } else {
        }
        ldv_s_mdc800_device_ops_file_operations = ldv_s_mdc800_device_ops_file_operations + 1;
      } else {
      }
      goto ldv_24316;
      case_3: ;
      if (ldv_s_mdc800_device_ops_file_operations == 3) {
        {
        mdc800_device_release(var_group2, var_group1);
        ldv_s_mdc800_device_ops_file_operations = 0;
        }
      } else {
      }
      goto ldv_24316;
      case_4: ;
      if (ldv_s_mdc800_usb_driver_usb_driver == 0) {
        {
        res_mdc800_usb_probe_7 = mdc800_usb_probe(var_group3, var_mdc800_usb_probe_7_p1);
        ldv_check_return_value(res_mdc800_usb_probe_7);
        }
        if (res_mdc800_usb_probe_7 != 0) {
          goto ldv_module_exit;
        } else {
        }
        ldv_s_mdc800_usb_driver_usb_driver = ldv_s_mdc800_usb_driver_usb_driver + 1;
      } else {
      }
      goto ldv_24316;
      case_5: ;
      if (ldv_s_mdc800_usb_driver_usb_driver == 1) {
        {
        mdc800_usb_disconnect(var_group3);
        ldv_s_mdc800_usb_driver_usb_driver = 0;
        }
      } else {
      }
      goto ldv_24316;
      switch_default: ;
      goto ldv_24316;
    } else {
      switch_break: ;
    }
    }
  }
  ldv_24316: ;
  ldv_24324:
  {
  tmp___1 = __VERIFIER_nondet_int();
  }
  if (tmp___1 != 0) {
    goto ldv_24323;
  } else
  if (ldv_s_mdc800_device_ops_file_operations != 0) {
    goto ldv_24323;
  } else
  if (ldv_s_mdc800_usb_driver_usb_driver != 0) {
    goto ldv_24323;
  } else {
    goto ldv_24325;
  }
  ldv_24325: ;
  ldv_module_exit:
  {
  usb_mdc800_cleanup();
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
int ldv_spin = 0;
void ldv_check_alloc_flags(gfp_t flags )
{
  {
  if (ldv_spin != 0) {
    if (flags != 32U) {
      {
      ldv_blast_assert();
      }
    } else {
    }
  } else {
  }
  return;
}
}
extern struct page *ldv_some_page(void) ;
struct page *ldv_check_alloc_flags_and_return_some_page(gfp_t flags )
{ struct page *tmp ;
  {
  if (ldv_spin != 0) {
    if (flags != 32U) {
      {
      ldv_blast_assert();
      }
    } else {
    }
  } else {
  }
  {
  tmp = ldv_some_page();
  }
  return (tmp);
}
}
void ldv_check_alloc_nonatomic(void)
{
  {
  if (ldv_spin != 0) {
    {
    ldv_blast_assert();
    }
  } else {
  }
  return;
}
}
void ldv_spin_lock(void)
{
  {
  ldv_spin = 1;
  return;
}
}
void ldv_spin_unlock(void)
{
  {
  ldv_spin = 0;
  return;
}
}
int ldv_spin_trylock(void)
{ int is_lock ;
  {
  {
  is_lock = __VERIFIER_nondet_int();
  }
  if (is_lock != 0) {
    return (0);
  } else {
    ldv_spin = 1;
    return (1);
  }
}
}
void *ldv_malloc(size_t size ) ;
__inline static void *kmalloc(size_t size , gfp_t flags )
{
  {
  {
  ldv_check_alloc_flags(flags);
  ldv_kmalloc_12(size, flags);
  }
  return ((void *)0);
}
}
void *ldv_kmem_cache_alloc_16(struct kmem_cache *ldv_func_arg1 , gfp_t ldv_func_arg2 )
{
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  kmem_cache_alloc(ldv_func_arg1, ldv_func_arg2);
  }
  return ((void *)0);
}
}
void *ldv_zalloc(size_t size ) ;
extern _Bool __VERIFIER_nondet_bool(void) ;
extern void *calloc(size_t, size_t) ;
void *ldv_zalloc(size_t size )
{
  if(__VERIFIER_nondet_bool()) return 0;
  return calloc(1UL, size);
}
__inline static void *kzalloc(size_t size , gfp_t flags )
{ void *tmp ;
  {
  {
  ldv_check_alloc_flags(flags);
  tmp = ldv_zalloc(size);
  }
  return (tmp);
}
}
int ldv_usb_submit_urb_19(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ int tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_submit_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
int ldv_usb_submit_urb_20(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ int tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_submit_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
int ldv_usb_submit_urb_21(struct urb *ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ int tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_submit_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
struct urb *ldv_usb_alloc_urb_22(int ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ struct urb *tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_alloc_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
struct urb *ldv_usb_alloc_urb_23(int ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ struct urb *tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_alloc_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
struct urb *ldv_usb_alloc_urb_24(int ldv_func_arg1 , gfp_t ldv_func_arg2 )
{ struct urb *tmp ;
  {
  {
  ldv_check_alloc_flags(ldv_func_arg2);
  tmp = usb_alloc_urb(ldv_func_arg1, ldv_func_arg2);
  }
  return (tmp);
}
}
void __init_waitqueue_head(wait_queue_head_t *arg0, const char *arg1, struct lock_class_key *arg2) {
  return;
}
void __mutex_init(struct mutex *arg0, const char *arg1, struct lock_class_key *arg2) {
  return;
}
void __wake_up(wait_queue_head_t *arg0, unsigned int arg1, int arg2, void *arg3) {
  return;
}
unsigned long __VERIFIER_nondet_ulong(void);
unsigned long int _copy_to_user(void *arg0, const void *arg1, unsigned int arg2) {
  return __VERIFIER_nondet_ulong();
}
int __VERIFIER_nondet_int(void);
int _dev_info(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int dev_err(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
void *dev_get_drvdata(const struct device *arg0) {
  return ldv_malloc(0UL);
}
int __VERIFIER_nondet_int(void);
int dev_set_drvdata(struct device *arg0, void *arg1) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int dev_warn(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
void finish_wait(wait_queue_head_t *arg0, wait_queue_t *arg1) {
  return;
}
void *kmem_cache_alloc(struct kmem_cache *arg0, gfp_t arg1) {
  return ldv_malloc(0UL);
}
void ldv_check_final_state() {
  return;
}
void ldv_check_return_value(int arg0) {
  return;
}
void ldv_initialize() {
  return;
}
struct page *ldv_some_page() {
  return ldv_malloc(sizeof(struct page));
}
void might_fault() {
  return;
}
void mutex_lock_nested(struct mutex *arg0, unsigned int arg1) {
  return;
}
void mutex_unlock(struct mutex *arg0) {
  return;
}
void prepare_to_wait(wait_queue_head_t *arg0, wait_queue_t *arg1, int arg2) {
  return;
}
int __VERIFIER_nondet_int(void);
int printk(const char *arg0, ...) {
  return __VERIFIER_nondet_int();
}
long __VERIFIER_nondet_long(void);
long int schedule_timeout(long arg0) {
  return __VERIFIER_nondet_long();
}
struct urb *usb_alloc_urb(int arg0, gfp_t arg1) {
  return ldv_malloc(sizeof(struct urb));
}
void usb_deregister(struct usb_driver *arg0) {
  return;
}
void usb_deregister_dev(struct usb_interface *arg0, struct usb_class_driver *arg1) {
  return;
}
void usb_free_urb(struct urb *arg0) {
  return;
}
void usb_kill_urb(struct urb *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int usb_register_dev(struct usb_interface *arg0, struct usb_class_driver *arg1) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int usb_register_driver(struct usb_driver *arg0, struct module *arg1, const char *arg2) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int usb_submit_urb(struct urb *arg0, gfp_t arg1) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int autoremove_wake_function(wait_queue_t *arg0, unsigned int arg1, int arg2, void * arg3) {
  return __VERIFIER_nondet_int();
}
void free(void *);
void kfree(void const *p) {
  free((void *)p);
}
void __bad_percpu_size(void) {
}
