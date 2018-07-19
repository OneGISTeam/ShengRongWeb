package com.shengrong.hibernate;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Recruit entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Recruit
 * @author MyEclipse Persistence Tools
 */
public class RecruitDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(RecruitDAO.class);
	// property constants
	public static final String RECRUITNAME = "recruitname";
	public static final String AGE = "age";
	public static final String WORKPLACE = "workplace";
	public static final String PAYMENT = "payment";
	public static final String RECRUITNUMBER = "recruitnumber";
	public static final String DUTY = "duty";
	public static final String REQUIREMENT = "requirement";

	public void save(Recruit transientInstance) {
		log.debug("saving Recruit instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Recruit persistentInstance) {
		log.debug("deleting Recruit instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Recruit findById(java.lang.Integer id) {
		log.debug("getting Recruit instance with id: " + id);
		try {
			Recruit instance = (Recruit) getSession().get(
					"com.shengrong.hibernate.Recruit", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Recruit instance) {
		log.debug("finding Recruit instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Recruit")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Recruit instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Recruit as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRecruitname(Object recruitname) {
		return findByProperty(RECRUITNAME, recruitname);
	}

	public List findByAge(Object age) {
		return findByProperty(AGE, age);
	}

	public List findByWorkplace(Object workplace) {
		return findByProperty(WORKPLACE, workplace);
	}

	public List findByPayment(Object payment) {
		return findByProperty(PAYMENT, payment);
	}

	public List findByRecruitnumber(Object recruitnumber) {
		return findByProperty(RECRUITNUMBER, recruitnumber);
	}

	public List findByDuty(Object duty) {
		return findByProperty(DUTY, duty);
	}

	public List findByRequirement(Object requirement) {
		return findByProperty(REQUIREMENT, requirement);
	}

	public List findAll() {
		log.debug("finding all Recruit instances");
		try {
			String queryString = "from Recruit";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Recruit merge(Recruit detachedInstance) {
		log.debug("merging Recruit instance");
		try {
			Recruit result = (Recruit) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Recruit instance) {
		log.debug("attaching dirty Recruit instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Recruit instance) {
		log.debug("attaching clean Recruit instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}