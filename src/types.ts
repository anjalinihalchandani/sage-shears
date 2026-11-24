export type Status='waiting'|'serving'|'completed'|'absent';
export type Service={id:string;name:string;minutes:number;icon:string;desc:string};
export type Barber={id:string;name:string;specialty:string;status:'available'|'break'|'offline';initials:string};
export type Entry={id:string;token:string;name:string;service:string;minutes:number;barberId:string;status:Status;joinedAt:number;calledAt?:number;completedAt?:number;rating?:number;comment?:string};
