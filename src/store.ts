import { create } from 'zustand'; import type { Barber, Entry } from './types'; import { initialBarbers, seedEntries } from './data';
type Store={entries:Entry[];barbers:Barber[];add:(e:Entry)=>void;update:(id:string,patch:Partial<Entry>)=>void;setBarber:(id:string,status:Barber['status'])=>void;reset:()=>void};
const saved=localStorage.getItem('sage-shears-demo'); const initial=saved?JSON.parse(saved):{entries:seedEntries,barbers:initialBarbers};
export const useQueueStore=create<Store>((set)=>({entries:initial.entries,barbers:initial.barbers,add:e=>set(s=>({entries:[...s.entries,e]})),update:(id,patch)=>set(s=>({entries:s.entries.map(e=>e.id===id?{...e,...patch}:e)})),setBarber:(id,status)=>set(s=>({barbers:s.barbers.map(b=>b.id===id?{...b,status}:b)})),reset:()=>set({entries:seedEntries,barbers:initialBarbers})}));
useQueueStore.subscribe(s=>localStorage.setItem('sage-shears-demo',JSON.stringify({entries:s.entries,barbers:s.barbers})));
export const barberEntries=(entries:Entry[],id:string)=>entries.filter(e=>e.barberId===id&&['waiting','serving'].includes(e.status)).sort((a,b)=>a.joinedAt-b.joinedAt);
